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
        res.view('perfil');
    },

    getInfo: function(req, res) {
        // Pending to do with a procedure call.
        //let query = `call SimaplaDb.getInfoStudent('` + req.param('carne') + `')`;
        let query = `select * from Students s where s.carnet = "`+req.session.me.carnet+`" limit 1;`;
        connection.query(query, {}, res, (resObject, res) => {
            if (resObject.error == 'none') {
                let data = resObject.data;
                if (typeof data[0] != 'undefined'){
                    console.log("Retornando: "+resObject.data);
                    res.json(resObject.data);
                } else {
                    res.json({resObject});
                }
            }
        });
    }
};
