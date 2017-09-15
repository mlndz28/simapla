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

    login: (req, res) => {
      if (!req.param('carnet') || !req.param('password')) {
        return res.json(401, {error: 'Carnet y password necesarios.'});
      }

      let carnet = req.param('carnet');
      let password = req.param('password');

      let query = `call SimaplaDb.loginGet('${carnet}', '${password}')`;
      debug(`login query: ${query}`);

      connection.query(query, {}, res, (mysqlResponse, res) => {
        debug(`mysqlResponse:`);
        debug(mysqlResponse);

        if (mysqlResponse.error !== 'none') {
          debug("Error: ");
          debug(mysqlResponse.error);
          return res.json({error: mysqlResponse.error});
        }

        let data = mysqlResponse.data;

        if (typeof data[0] == 'undefined' || data[0].length == 0) {
          return res.json({error: "Los credenciales no son correctos."});
        }

        if (data[0].length > 0) {
          debug('data[0]');
          debug(data[0][0]);
          debug(JSON.stringify(data[0][0]));
          debug('data[0].idPerson: ' + data[0][0]['idPerson']);
          debug('data[0].role: ' + data[0][0].role);
          let idPerson = data[0][0].idPerson;
          let role = data[0][0].role;
          return res.json({
            error:false,
            token:jwtService.issue({uid: idPerson, carnet: carnet, role: role}),
            uid: idPerson,
            carnet: carnet,
            role: role
          });
        }
        return res.json({error: "Error desconocido"});
      });
    }

};
