const app = require('express')();

const bodyParser = require('body-parser');
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

const { query } = require('./src/plugins/mysql');
const port = 3000;

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

app.all('*', (req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With,Content-Type");
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By", '3.2.1')
  res.header("Content-Type", "application/json;charset=utf-8");
  next();
});

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
app.put('/updateCourseToSubgoal', (req, res) => {
  const { percent, subgoal_id, course_id } = req.body;
  const statement = `UPDATE courseToSubgoal SET percent = ${percent} WHERE subgoal_id = "${subgoal_id}" AND course_id = ${course_id}`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.delete('/deleteCourseToSubgoal', (req, res) => {
  const { subgoal_id, course_id } = req.query;
  const statement = `DELETE FROM courseToSubgoal WHERE subgoal_id = "${subgoal_id}" AND course_id = ${course_id}`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

app.put('/addCourseToSubgoal', (req, res) => {
  const { percent, subgoal_id, course_id } = req.body;
  const statement = `INSERT INTO courseToSubgoal VALUES (NULL ,"${subgoal_id}", ${course_id}, ${percent})`;
  query(statement).then((resolve, rejected) => {
    res.send(resolve);
  });
});

/* user */
app.post('/userLogin', (req, res) => {
  const { username, password, lang } = req.body;
  const isEN = lang === "en";
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

app.put('/userRegister', (req, res) => {
  const { username, password, lang } = req.body;
  const isEN = lang === "en";
  const statement = `INSERT INTO teacher VALUES (null, 0, '${username}', '${password}', '', '', '', '')`;
  const subStatement = `SELECT id, is_admin, ${isEN ? 'name_EN as name' : 'name'}, TEL, email FROM teacher WHERE username = '${username}'`;
  query(subStatement).then((resolve, rejected) => {
    if (resolve.length) {
      res.send({
        statusCode: 400,
      });
    } else {
      query(statement).then((resolve, rejected) => {
        query(subStatement).then((resolve, reject) => {
          res.send(resolve[0]);
        });
      });
    }
  });
});
