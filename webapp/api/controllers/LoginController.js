/**
 * LoginController
 *
 * @description :: Server-side logic for managing logincontrollers
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const path = require('path');

module.exports = {
  show: (req, res) => {
    return res.view('login', {});
  },
  login: (req, res) => {
		if (req.session.logged) return res.redirect('admin');
    if (req.param('carne') == 'xxx' && req.param('password') == 'supersecret') {
			req.session.logged = true;
      return res.redirect('admin');
    } else {
			res.view('login', {'error': 'Datos Incorrectos'});
    }
  },
	logout: (req, res) => {
		req.session.logged = false;
		return res.redirect('/');
	}

};