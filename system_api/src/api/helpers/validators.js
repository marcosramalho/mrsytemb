const ValidationError = require('../errors/validationError');

module.exports = {
  validatorSignUp(user) {
    if (!user.name) {
      throw new ValidationError('Nome é obrigatório');
    }
    if (!user.email) {
      throw new ValidationError('Email é obrigatório');
    }
    if (!user.password) {
      throw new ValidationError('Senha é obrigatório');
    }
    if (!user.address.street) {
      throw new ValidationError('Rua é obrigatório');
    }
    if (!user.address.number) {
      throw new ValidationError('Número da residência é obrigatório');
    }
    if (!user.address.cep) {
      throw new ValidationError('CEP é obrigatório');
    }
    if (!user.address.state) {
      throw new ValidationError('Estado é obrigatório');
    }
    if (!user.address.city) {
      throw new ValidationError('Cidade é obrigatório');
    }
    if (!user.address.district) {
      throw new ValidationError('Bairro é obrigatório');
    }
  },
};
