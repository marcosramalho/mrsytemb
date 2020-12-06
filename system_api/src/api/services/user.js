const bcrypt = require('bcrypt');

const User = require('../models/user');

module.exports = {
  async create(data) {
    return User.create(data);
  },

  async findByEmail(email) {
    return User.findOne({
      where: {
        email,
        deletedAt: null,
      },
    });
  },

  hashPassword(passwd) {
    const salt = bcrypt.genSaltSync(10);
    return bcrypt.hashSync(passwd, salt);
  },
};
