const request = require('supertest');

const app = require('../src/app');

describe('Start Application', () => {
  test('Should response root', () => {
    return request(app)
      .get('/')
      .then((res) => {
        expect(res.status).toBe(200);
      });
  });
});
