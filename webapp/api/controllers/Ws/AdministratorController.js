/**
 * Ws/PersonController
 *
 * @description :: Server-side logic for managing ws/users
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

let connection = DbConnectionService;
module.exports = {

  // connection: DbConnectionService.getConnection(),

  get: function(req, res) {
    let columns = [
      '*'
    ].join(', ');
    let query = `select p.name from Person p where carnet = 'mdp16003' and password = 'pw3'`;
    connection.query(query, {}, res);
  },

  post: function(req, res) {
    let columns = [
      'carnet',
      'cedula',
      'name',
      'lastname',
      'birthdate',
      'password',
      'dateJoinedProgram',
      'salt',
      'SpecificAddress_idSpecificAddress',
      'Email_idEmail',
      'Phone_idPhone'
    ].join(', ');
    let values = [
      `'${req.param('carnet')}'`,
      `'${req.param('cedula')}'`,
      `'${req.param('name')}'`,
      `'${req.param('lastname')}'`,
      `'${req.param('birthdate')}'`,
      `'${req.param('password')}'`,
      `'${req.param('dateJoinedProgram')}'`,
      `'${req.param('salt')}'`,
      `'${req.param('SpecificAddress_idSpecificAddress')}'`,
      `'${req.param('Email_idEmail')}'`,
      `'${req.param('Phone_idPhone')}'`
    ].join(', ');
    let query = `INSERT INTO \`Person\`
    (${columns})
    VALUES
    (${values});`;
    connection.query(query, {}, res);
  },

  put: function(req, res) {
    return res.send({});
  },

  delete: function(req, res) {
    return res.send({});
  }

};
