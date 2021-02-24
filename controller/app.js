const express = require('express');
const { select } = require('./src/plugins/mysql');
const app = express();
const port = 3000;

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

app.all('*', (req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin','*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST');  
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type, Authorization');  
  // res.setHeader("Content-Type", "application/json;charset=utf-8"); 
  next();
});

// TODO - router
app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/requirements', (req, res) => {
  const query = 'SELECT * FROM requirements';
  select(query).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/subGoals', (req, res) => {
  const query = 'SELECT * FROM subGoals';
  select(query).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/coursesToSubgoalsView', (req, res) => {
  const query = 'SELECT * FROM coursestosubgoalsview';
  select(query).then((resolve, rejected) => {
    res.send(resolve);
  });
});
