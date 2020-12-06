module.exports = (app) => {
  app.use('/auth', app.api.routes.auth);
};
