/**
* Ws/MyselfController
*
* @description :: Server-side logic for managing ws/users
* @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
*/

let connection = DbConnectionService;
module.exports = {

    //connection: DbConnectionService.getConnection(),
    get: function(req, res) {
        if (!req.session.me || req.session.me == {}) {
            return res.redirect('/');
        }
        res.view('perfil');
    },

    getInfo: function(req, res) {
        // Pending to do with a procedure call.
        //let query = `call SimaplaDb.getInfoStudent('` + req.param('carne') + `')`;
        console.log("LOG MyselfController session.me: "+JSON.stringify(req.session.me));
        let query = `select * from Students s where s.cedula = "`+req.session.me.cedula+`" limit 1;`;
        connection.query(query, {}, res, (resObject, res) => {
            if (resObject.error == 'none') {
                let data = resObject.data;
                if (typeof data[0] != 'undefined'){
                    //console.log("LOG MyselfController resObject.data: "+resObject.data);
                    res.json(resObject.data);
                } else {
                    res.json({resObject});
                }
            }
        });
    }
};
