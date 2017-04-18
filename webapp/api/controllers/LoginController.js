/**
 * LoginController
 *
 * @description :: Server-side logic for managing logincontrollers
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const path = require('path');
let connection = DbConnectionService;

module.exports = {
  show: (req, res) => {
    if (req.session.logged) return res.redirect('/admin');
    return res.view('login', {title:'Simapla Digital - Iniciar Sesión'});
  },
  login: (req, res) => {
  let columns = [
    '*'
  ].join(', ');
  let query = `select p.name from Person p where carnet = 'mdp16003' and password = 'pwd3'`;
  connection.query(query, {}, res, (results, res) => {
    if (results.error == 'none') {
      let data = results.data;
      if (typeof data[0] != 'undefined'){
        req.session.logged = true;
        req.session.me.name = results.data[0].name;
        res.redirect('/admin');
      } else {
          console.log("datazz"+data);
        res.redirect('/login');
      }
    }
  });
  },
	logout: (req, res) => {
		req.session.logged = false;
		return res.redirect('/');
	}

};
