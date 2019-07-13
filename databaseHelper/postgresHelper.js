const pg = require('pg');

const client = new pg.Client({
    user:process.env.user,
    password:process.env.password,
    database:process.env.database,
    port:process.env.port,
    host:process.env.host,
    ssl: true
});

client.connect().then(()=>{
  console.log('Postgress connected');
});

module.exports = {
  dbClient: client
}

