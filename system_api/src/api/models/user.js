const { Model, DataTypes } = require('sequelize');

class User extends Model {
  static init(sequelize) {
    super.init(
      {
        userId: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          field: 'usu_id',
        },
        name: {
          type: DataTypes.STRING,
          field: 'usu_name',
        },
        email: {
          type: DataTypes.STRING,
          field: 'usu_email',
        },
        password: {
          type: DataTypes.STRING,
          field: 'usu_password',
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
        tableName: 'users',
      },
    );
  }

  static associate(models) {
    this.hasMany(models.Address, { foreignKey: 'usu_id', as: 'users' });
  }
}

module.exports = User;
