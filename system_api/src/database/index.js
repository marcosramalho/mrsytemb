const Sequelize = require('sequelize');
const dbConfig = require('../config/env');

const connection = new Sequelize(dbConfig);

const User = require('../api/models/user');
const Address = require('../api/models/address');

User.init(connection);
Address.init(connection);

User.associate(connection.models);
Address.associate(connection.models);

module.exports = connection;
