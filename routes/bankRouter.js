const express = require('express');
const router = express.Router();
const { verifyToken } = require('../middlewares/auth');
const client = require('../databaseHelper/postgresHelper').dbClient;
router.post('/allbanks',verifyToken,(req,res)=>{
  const offset = parseInt(req.query.offset)||0;
  var limit = parseInt(req.query.limit);
  let query = '';
  if(isNaN(limit))
  query = {
    text:'select * from branches inner join banks on branches.bank_id = banks.id where ifsc=$1 offset $2;',
    values:[req.body.ifsc,offset]
  };
  else query = {
    text:'select * from branches inner join banks on branches.bank_id = banks.id where ifsc=$1 offset $2 limit $3;',
    values:[req.body.ifsc,offset,limit]
  };

  client.query(query,(err,r)=>{
    if(err) return res.status(401).send(err);
    //Check for no banks found would be better on front end side
    return res.json(r.rows);
  })
})

router.post('/allbranches',verifyToken,(req,res)=>{
  const offset = parseInt(req.query.offset)||0;
  var limit = parseInt(req.query.limit);
  let query = '';
  if(isNaN(limit))
  query = {
    text:'select * from bank_branches where city=$1 and bank_name=$2 offset $3;',
    values:[req.body.city,req.body.bank_name,offset]
  };
  else query = {
    text:'select * from bank_branches where city=$1 and bank_name=$2 offset $3 limit $4;',
    values:[req.body.city,req.body.bank_name,offset,limit]
  };
  client.query(query,(err,r)=>{
    if(err) return res.status(401).send(err);
    //Checks for no branches found would be better on front end side
    return res.json(r.rows);
  })
})




module.exports = router;
