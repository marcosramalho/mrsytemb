const express = require('express');

const app = express();
const consign = require('consign');
const db = require('./database');

app.use(express.json());

app.db = db;

consign({ cwd: 'src', verbose: false })
  .then('./api/services')
  .then('./api/controllers')
  .then('./api/routes')
  .then('./common/router.js')
  .into(app);

app.get('/', (req, res) => {
  res.status(200).send();
});

app.use((err, req, res, next) => {
  const { name, message, stack } = err;
  if (name === 'ValidationError') res.status(400).json({ error: message });
  else res.status(500).json({ name, message, stack });
  next(err);
});

module.exports = app;
