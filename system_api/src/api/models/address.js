const { Model, DataTypes } = require('sequelize');

class Address extends Model {
  static init(sequelize) {
    super.init(
      {
        addressId: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          field: 'add_id',
        },
        cep: {
          type: DataTypes.STRING,
          field: 'add_cep',
        },
        number: {
          type: DataTypes.STRING,
          field: 'add_number',
        },
        street: {
          type: DataTypes.STRING,
          field: 'add_street',
        },
        district: {
          type: DataTypes.STRING,
          field: 'add_district',
        },
        state: {
          type: DataTypes.STRING,
          field: 'add_state',
        },
        city: {
          type: DataTypes.STRING,
          field: 'add_city',
        },
        userId: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          field: 'usu_id',
        },
        createdAt: {
          type: DataTypes.DATE,
          defaultValue: new Date(),
        },
        deletedAt: {
          type: DataTypes.DATE,
          defaultValue: null,
        },
        updatedAt: {
          type: DataTypes.DATE,
          defaultValue: null,
        },
      },
      {
        sequelize,
        tableName: 'addresses',
      },
    );
  }

  static associate(models) {
    this.belongsTo(models.User, { foreignKey: 'usu_id', as: 'users' });
  }
}

module.exports = Address;
