const mysql = require('mysql');
const mysqlConfig = require('../conf/mysql.json');

const connection = mysql.createConnection(mysqlConfig);
 
connection.connect();

exports.query = (query) => new Promise((res, rej) => {
  connection.query(query, (error, results, fields) => {
    console.log(`query: ${query}`);
    if (error) {
      console.log(`error: ${error}`)
      rej(error);
    } else {
      console.log(`results: ${results.length}`);
      res(results);
    }
  });
});
