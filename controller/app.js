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
/* requirement */
app.get('/requirement', (req, res) => {
  const isEN = req.query.lang === "en";
  const statement = `SELECT id, ${isEN ? 'title_EN as title' : 'title'}, ${isEN ? 'statement_EN as statement' : 'statement'} FROM requirement`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/subgoal', (req, res) => {
  const isEN = req.query.lang === "en";
  const statement = `SELECT id, father_id, ${isEN ? 'statement_EN as statement' : 'statement'} FROM subgoal`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/courseToSubgoalView', (req, res) => {
  const isEN = req.query.lang === "en";
  const statement = `SELECT subgoal_id, course_id, ${isEN ? 'name_EN as name' : 'name'}, percent FROM courseToSubgoalView ORDER BY id ASC`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

/* course */
app.get('/course', (req, res) => { // for add selection
  const isEN = req.query.lang === "en";
  const statement = `SELECT id, ${isEN ? 'name_EN as name' : 'name'} FROM course`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

/* courseToSubgoal - CRUD */
app.get('/updateCourseToSubgoal', (req, res) => {
  const { percent, subgoal_id, course_id } = req.query;
  const statement = `UPDATE courseToSubgoal SET percent = ${percent} WHERE subgoal_id = "${subgoal_id}" AND course_id = ${course_id}`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/deleteCourseToSubgoal', (req, res) => {
  const { subgoal_id, course_id } = req.query;
  const statement = `DELETE FROM courseToSubgoal WHERE subgoal_id = "${subgoal_id}" AND course_id = ${course_id}`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.get('/addCourseToSubgoal', (req, res) => {
  const { percent, subgoal_id, course_id } = req.query;
  const statement = `INSERT INTO courseToSubgoal VALUES (NULL ,"${subgoal_id}", ${course_id}, ${percent})`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

/* user */
app.get('/userLogin', (req, res) => {
  const isEN = req.query.lang === "en";
  const { username, password } = req.query;
  const statement = `SELECT id, password FROM teacher WHERE username="${username}"`;
  query(statement).then((resolve, rejected) => {
    if (resolve.length) {
      const { id: user_id, password: user_password } = resolve[0];
      if (user_password === password) {
        const subStatement = `SELECT id, is_admin, ${isEN ? 'name_EN as name' : 'name'}, TEL, email FROM teacher WHERE id = ${user_id}`
        query(subStatement).then((resolve, rejected) => {
          res.send(resolve[0]);
        })
      } else {
        res.send({
          statusCode: 403,
        });
      }
    } else {
      res.send({
        statusCode: 404,
      });
    }
  });
});
