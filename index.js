const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const bankRoutes = require('./routes/bankRouter');
const userRoutes = require('./routes/userRoutes');

app.use(bodyParser.json());
app.use('/api/bank',bankRoutes);
app.use('/api/user',userRoutes);
const PORT = process.env.PORT;
app.listen(PORT,()=>{
  console.log('Listening to port ',PORT);
});
