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
        let query = `select p.cedula from Person p where carnet = '` + req.param('carne') + `' and password = '` + req.param('password') + `'`;
        console.log("LOG LoginController query: "+query);
        connection.query(query, {}, res, (resObject, res) => {
            if (resObject.error == 'none') {
                let data = resObject.data;
                if (typeof data[0] != 'undefined'){
                    req.session.logged = true;
                    req.session.me = {};
                    req.session.me.role = 1; // TODO: Obtener el rol con un procedimiento desde la base
                    console.log("LOG LoginController resObject: "+JSON.stringify(resObject.data));
                    req.session.me.cedula = resObject.data[0].cedula;
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
            console.log("LOG LoginController Logged out user: "+JSON.stringify(req.session.me.cedula));
        req.session.logged = false;
        req.session.me = undefined;
        return res.redirect('/');
    }

};
