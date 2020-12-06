module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.createTable('users', {
      usu_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      usu_name: {
        type: Sequelize.STRING(255),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      usu_email: {
        type: Sequelize.STRING(60),
        allowNull: false,
        unique: true,
        validate: {
          notEmpty: true,
          isEmail: true,
        },
      },
      usu_password: {
        type: Sequelize.STRING(255),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      updatedAt: {
        type: Sequelize.DATE,
        allowNull: true,
      },
      deletedAt: {
        type: Sequelize.DATE,
        allowNull: true,
      },
    });
  },

  down: async (queryInterface) => {
    return queryInterface.dropTable('users');
  },
};
