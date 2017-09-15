/**
* Ws/MyselfController
*
* @description :: Server-side logic for managing ws/users
* @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
*/
const debug = require('debug')('simapla:MyselfController');

let connection = DbConnectionService;
module.exports = {

    //connection: DbConnectionService.getConnection(),
    get: function(req, res) {
        if (!req.session.me || req.session.me == {}) {
            return res.redirect('/');
        }
        res.view('perfil');
    },

    personInfo: function(req, res) {
      let query = `CALL personInfoGet(${req.params.idPerson});`;
      connection.query(query, {}, res);

    },

    getInfo: function(req, res) {
        // Pending to do with a procedure call.
        //let query = `call SimaplaDb.getInfoStudent('` + req.param('carne') + `')`;
        console.log("LOG MyselfController session.me: "+JSON.stringify(req.session.me));
        switch (req.session.me.role) {
            case 0:
                view = "Students"
                break;
            case 1:
                view = "Administrators"
                break;
            case 2:
                view = "Teachers"
                break;
            case 3:
                view = "Responsibles"
                break;
            default:
                view = "Persons";
        }
        let query = `select * from ` + view + ` v where v.carnet = "`+req.session.me.carnet+`" limit 1;`;
        connection.query(query, {}, res, (resObject, res) => {
            if (resObject.error == 'none') {
                let data = resObject.data;
                console.log("LOG MyselfController resObject.data: "+JSON.stringify(resObject.data));
                if (typeof data[0] != 'undefined'){
                    res.json(resObject.data);
                } else {
                    res.json({resObject});
                }
            }
        });
    }
};
