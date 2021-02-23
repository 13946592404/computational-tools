const mysql = require('mysql');
const mysqlConfig = require('./mysqlConfig.json');

const connection = mysql.createConnection(mysqlConfig);
 
connection.connect();

exports.select = (query) => new Promise((res, rej) => {
  connection.query(query, (error, results, fields) => {
    if (error) {
      rej(error);
    }
    res(results);
  });
});
