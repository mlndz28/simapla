/**
 * Ws/PersonController
 *
 * @description :: Server-side logic for managing ws/users
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

let connection = DbConnectionService;
module.exports = {

  // connection: DbConnectionService.getConnection(),
  show: function(req, res){
      return res.view('perfil')
  },
  get: function(req, res) {
    res.json({name: req.session.me.name});
  }

};
