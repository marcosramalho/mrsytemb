const Address = require('../models/address');

module.exports = {
  async create(data) {
    return Address.create(data);
  },
};
