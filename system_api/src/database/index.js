const Sequelize = require('sequelize');
const dbConfig = require('../config/env');

const connection = new Sequelize(dbConfig);

module.exports = connection;
