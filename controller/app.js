const express = require('express');
const { select } = require('./src/plugins/mysql');
const app = express();
const port = 3000;

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/sql', (req, res) => {
  select('SELECT * FROM courses').then((resolve, rejected) => {
    res.send(resolve);
  });
});
