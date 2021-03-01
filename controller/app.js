const express = require('express');
const { query } = require('./src/plugins/mysql');
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
  const statement = `SELECT id, ${isEN ? 'title_EN as title' : 'title'}, ${isEN ? 'statement_EN as statement' : 'statement'} FROM requirements`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/subGoals', (req, res) => {
  const isEN = req.query.lang === "en";
  const statement = `SELECT id, father_id, ${isEN ? 'statement_EN as statement' : 'statement'} FROM subGoals`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/courses', (req, res) => { // for add selection
  const isEN = req.query.lang === "en";
  const statement = `SELECT id, ${isEN ? 'name_EN as name' : 'name'}, ${isEN ? 'teacher_EN as teacher' : 'teacher'} FROM courses`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/coursesToSubgoalsView', (req, res) => {
  const isEN = req.query.lang === "en";
  const statement = `SELECT subgoal_id, course_id, ${isEN ? 'name_EN as name' : 'name'}, percent FROM coursestosubgoalsview`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/updateCoursesToSubgoals', (req, res) => {
  const { percent, subgoal_id, course_id } = req.query;
  const statement = `UPDATE CoursesToSubgoals SET percent = ${percent} WHERE subgoal_id = "${subgoal_id}" AND course_id = ${course_id}`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/deleteCoursesToSubgoals', (req, res) => {
  const { subgoal_id, course_id } = req.query;
  const statement = `DELETE FROM CoursesToSubgoals WHERE subgoal_id = "${subgoal_id}" AND course_id = ${course_id}`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});
