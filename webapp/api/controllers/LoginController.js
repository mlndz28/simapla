/**
 * LoginController
 *
 * @description :: Server-side logic for managing logincontrollers
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const path = require('path');

module.exports = {
  show: (req, res) => {
    if (req.session.logged) return res.redirect('/admin');
    return res.view('login', {title:'Simapla Digital - Iniciar Sesión'});
  },
  login: (req, res) => {
	if (req.session.logged) return res.redirect('admin');

    DbConnectionService.query("select * from administrator","",res);

    if (req.param('carne') == 'xxx' && req.param('password') == 'supersecret') {
			req.session.logged = true;
      return res.redirect('admin');
    } else {
      return res.view('login', {
        title:'Simapla Digital - Iniciar Sesión',
        error: 'Datos Incorrectos'
      });
    }
  },
	logout: (req, res) => {
		req.session.logged = false;
		return res.redirect('/');
	}

};
