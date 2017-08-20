/**
* LoginController
*
* @description :: Server-side logic for managing logincontrollers
* @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
*/

const path = require('path');
const debug = require('debug')('simapla:LoginController');

let connection = DbConnectionService;

module.exports = {
    show: (req, res) => {
        if (req.session.logged) return res.redirect('/perfil');
        return res.view('login', {title:'Simapla Digital - Iniciar Sesión'});
    },

    login: (req, res) => {
        let query = `call SimaplaDb.loginGet('${req.param('carne')}', '${req.param('password')}')`;

        debug(`login query: ${query}`);

        connection.query(query, {}, res, (mysqlResponse, res) => {

            debug(`mysqlResponse:`);
            debug(mysqlResponse);

            if (mysqlResponse.error !== 'none') {
              debug("Error: ");
              debug(mysqlResponse.error);
              res.redirect('/login');
            }

            let data = mysqlResponse.data;

            if (typeof data[0] == 'undefined' || data[0].length == 0) {
              res.redirect('/login');
            }
            if (data[0].length > 0) {
              req.session.me = {};
              req.session.logged = true;
              req.session.me.role = data[0].role;
              req.session.me.carnet = data[0].carnet;

              debug("req.session.me:");
              debug(req.session.me);

              res.redirect('/perfil');
            }
        });
    },

    logout: (req, res) => {
        if(typeof req.session.me != 'undefined')
            console.log("LOG LoginController Logged out user: "+JSON.stringify(req.session.me.carnet));
        req.session.logged = false;
        req.session.me = undefined;
        return res.redirect('/');
    }

};
