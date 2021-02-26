const express = require('express');
const { select } = require('./src/plugins/mysql');
const app = express();
const port = 3000;

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

app.all('*', (req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin','*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT');  
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type, Authorization');  
  // res.setHeader("Content-Type", "application/json;charset=utf-8"); 
  next();
});

// TODO - router
app.get('/requirements', (req, res) => {
  const isEN = req.query.lang === "en";
  const query = `SELECT id, ${isEN ? 'title_EN as title' : 'title'}, ${isEN ? 'statement_EN as statement' : 'statement'} FROM requirements`;
  select(query).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/subGoals', (req, res) => {
  const isEN = req.query.lang === "en";
  const query = `SELECT id, father_id, ${isEN ? 'statement_EN as statement' : 'statement'} FROM subGoals`;
  select(query).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/coursesToSubgoalsView', (req, res) => {
  const isEN = req.query.lang === "en";
  const query = `SELECT subgoal_id, course_id, ${isEN ? 'name_EN as name' : 'name'}, percent FROM coursestosubgoalsview`; // TODO // sql en TODO
  select(query).then((resolve, rejected) => {
    res.send(resolve);
  });
});
