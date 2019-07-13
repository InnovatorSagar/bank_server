const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const Joi = require('@hapi/joi');
const bcrypt = require('bcrypt');
const client = require('../databaseHelper/postgresHelper').dbClient;
//Schema to validate uers while Login
const schema = {
  username: Joi.string().required().email(),
  password: Joi.string().required()
}

//Register Route
router.post('/register', (req,res)=>{
  const {error} = Joi.validate(req.body,schema);
  if(error)return res.status(403).send({"message":error.details[0].message});
  const query = {
    text :'select user_id from users where username=$1;',
    values:[req.body.username]
  };
  // console.log(client);
  client.query(query, async(err,r)=>{
    if(r.rowCount) return res.send({ "message":"User already exists" });
    const salt = await bcrypt.genSalt(10);
    const hashPassword = await bcrypt.hash(req.body.password,salt);
    const query = {
      text :'insert into users(username,password) values ($1,$2);',
      values:[req.body.username,hashPassword]
    };
    client.query(query,(err,r)=>{
            if(err)return res.send('Something went wrong');
            return res.send('User created');
          })
      })
})

//Login Route
router.post('/login',function(req,res){
  //Validating user fields
  const {error} = Joi.validate(req.body,schema);
  if(error) return res.status(403).send({"message":error.details[0].message})
  //Check if email exists
  const query = {
    text :'select user_id,username,password from users where username=$1;',
    values:[req.body.username]
  };
  client.query(query,async (err,r)=>{
    if(err) return res.status(403).send({"message":"Something sewnt wrong"});
    if(!r.rowCount) return res.send({"message":"No user exists with this email id"});
    //Check if password is correct
    const validPass = await bcrypt.compare(req.body.password,r.rows[0]['password']);
    if(!validPass) return res.json("Wrong password");
    const user = r.rows[0];
    const token = jwt.sign({_id:user.user_id,
                             username: user.username,
                           },process.env.TOKEN_SECRET,{expiresIn: '5days'});
    return res.header('auth-token',token).json("Token present in header as auth-token");
    })
})

module.exports = router;
