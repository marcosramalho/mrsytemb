const validators = require('../helpers/validators');

module.exports = (app) => {
  const signup = async (req, res, next) => {
    try {
      validators.validatorSignUp(req.body);
      const hasUserWithEmail = await app.api.services.user.findByEmail(
        req.body.email,
      );

      if (hasUserWithEmail) {
        return res
          .status(400)
          .json({ message: 'Email informado já cadastrado' });
      }
      req.body.password = app.api.services.user.hashPassword(req.body.password);
      const createUser = await app.api.services.user.create(req.body);
      const createAddress = await app.api.services.address.create({
        ...req.body.address,
        userId: createUser.userId,
      });

      delete createAddress.dataValues.createdAt;
      delete createAddress.dataValues.updatedAt;
      delete createAddress.dataValues.deletedAt;

      return res.status(201).json({
        name: createUser.name,
        email: createUser.email,
        userId: createUser.userId,
        address: createAddress,
      });
    } catch (error) {
      return next(error);
    }
  };

  return { signup };
};
