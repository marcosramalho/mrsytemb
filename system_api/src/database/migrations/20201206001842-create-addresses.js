module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.createTable('addresses', {
      add_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      add_cep: {
        type: Sequelize.STRING(10),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      add_number: {
        type: Sequelize.STRING(7),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      add_street: {
        type: Sequelize.STRING(120),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      add_district: {
        type: Sequelize.STRING(60),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      add_state: {
        type: Sequelize.STRING(20),
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      add_city: {
        type: Sequelize.STRING(30),
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
    return queryInterface.dropTable('addresses');
  },
};
