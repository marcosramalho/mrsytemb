const request = require('supertest');
const app = require('../src/app');

describe('Signup Controller', () => {
  test('Should return 201 if all data has been provided', () => {
    const email = `${Date.now()}@mail.com`;
    return request(app)
      .post('/auth/signup')
      .send({
        name: 'Marcos',
        password: '123456',
        email,
        address: {
          street: 'Rua ABC',
          number: '20',
          cep: '69000000',
          state: 'AM',
          city: 'Manaus',
          district: 'Ponta Negra',
        },
      })
      .then((res) => {
        expect(res.status).toBe(201);
        expect(res.body.name).toBe('Marcos');
        expect(res.body.email).toBe(email);
        expect(res.body.address.street).toBe('Rua ABC');
        expect(res.body.address.number).toBe('20');
        expect(res.body.address.cep).toBe('69000000');
        expect(res.body.address.state).toBe('AM');
        expect(res.body.address.city).toBe('Manaus');
        expect(res.body.address.district).toBe('Ponta Negra');
        expect(res.body).not.toHaveProperty('password');
      });
  });
});
