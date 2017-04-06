/**
 * Ws/UserController
 *
 * @description :: Server-side logic for managing ws/users
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */


module.exports = {

  // connection: DbConnectionService.getConnection(),

  get: function(req, res) {
    res.send({username:req.params.username});
  },

  post: function(req, res) {
    let columns = ['`id`', '`nombre`', '`email`', '`etc`'].join(', ');
    let values = [
      `${req.param('id')}`,
      `${req.param('nombre')}`,
      `${req.param('email')}`,
      `${req.param('etc')}`
    ].join(', ');
    let query = `INSERT INTO \`Users\` (${columns}) VALUES (${values})`;

    return res.send({});
  },

  put: function(req, res) {
    return res.send({});
  },

  delete: function(req, res) {
    return res.send({});
  }

};
