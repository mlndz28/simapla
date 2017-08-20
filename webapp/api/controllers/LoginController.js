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
        if (req.session.logged) return res.redirect('/perfil');
        return res.view('login', {title:'Simapla Digital - Iniciar Sesión'});
    },
    login: (req, res) => {
        let query = `call SimaplaDb.loginGet('` + req.param('carne') + `','` + req.param('password') + `');`;
        console.log("LOG LoginController query: "+query);
        connection.query(query, {}, res, (resObject, res) => {
            if (resObject.error == 'none') {
                let data = resObject.data;
                if (typeof data[0] != 'undefined'){
                    req.session.logged = true;
                    req.session.me = {};
                    console.log("LOG LoginController resObject.data[0][0]: "+JSON.stringify(resObject.data[0][0]));
                    req.session.me.role = resObject.data[0][0].role;
                    req.session.me.carnet = resObject.data[0][0].carnet;
                    console.log("LOG LoginController req.session.me: "+JSON.stringify(req.session.me));
                    res.redirect('/perfil');
                } else {
                    console.log("LOG LoginController resObject: "+JSON.stringify(resObject));
                    res.redirect('/login');
                }
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
