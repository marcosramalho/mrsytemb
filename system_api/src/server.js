const app = require('./app');

app.listen(process.env.PORT || 8000, () => {
  console.log('StartUp Application in port 8000');
});
