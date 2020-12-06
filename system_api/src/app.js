const app = require('express')();
const db = require('./database');

app.db = db;

app.get('/', (req, res) => {
  res.status(200).send();
});

module.exports = app;
