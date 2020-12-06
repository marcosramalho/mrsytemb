const express = require('express');

module.exports = (app) => {
  const router = express.Router();
  router.post('/signup', app.api.controllers.auth.signup);
  return router;
};
