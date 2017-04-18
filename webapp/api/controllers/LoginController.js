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
  let query = `select p.name from Person p where carnet = '` + req.param('carne') + `' and password = '` + req.param('password') + `'`;
  console.log(query);
  connection.query(query, {}, res, (resObject, res) => {
    if (resObject.error == 'none') {
      let data = resObject.data;
      if (typeof data[0] != 'undefined'){
        req.session.logged = true;
        req.session.me = {};
        req.session.me.name = resObject.data[0].name;
        res.redirect('/admin');
      } else {
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
