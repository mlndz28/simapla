/**
 * SignupController
 *
 * @description :: Server-side logic for managing signups
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const path = require('path');
const debug = require('debug')('simapla:SignupController');

 let connection = DbConnectionService;
 let mailSrv = EmailService;

module.exports = {
  show: (req, res) => {
        if(req.session.logged && req.session.me.role == 1){
            res.view('registroAdministrador');
        }else{
            res.view('registro');
        }
  },

  signup: (req, res) => {
    isFirstSignup(res, () => {
      req.param('role') = 1;
      signupMultiple(req, res);
    }, () => {
      signupMultiple(req,res);
    });
  },

    signupStudent: (req, res) => {
        var carnet = generateCarnet();
      let values = [
        `'`+carnet+`'`,//generateCarnet(), // req.param('pcarnet'),
        `'${req.param('pcedula')}'`,
        `'${req.param('pname')}'`,
        `'${req.param('plastname')}'`,
        `'${req.param('pbirthdate')}'`,
        `'${req.param('ppassword')}'`,
        'NOW()',// req.param('pdateJoinedProgram'),
        `'${req.param('pSpecificAddress')}'`,
        `'${req.param('pEmail')}'`,
        `'${req.param('pPhone')}'`,
        req.param('pIdDistrict'),
        req.param('pIsLefty'),
        req.param('pHasAdequacy'),
        `'${req.param('pSpecialCondition')}'`,
        `'${req.param('pMedication')}'`
      ].join(', ');
      let query = `call SimaplaDb.registerStudent(${values})`;
      console.log(query);
      connection.query(query, {}, res, (resObject, res) => {
          if (!resObject.error) {
              if (typeof resObject.data[3] != 'undefined'){
                  req.session.logged = true;
                  req.session.me = {};
                  req.session.me.role = 0;
                  console.log("LOG SignupController resObject: " + JSON.stringify(resObject.data[3][0].carnet));
                  req.session.me.carnet = resObject.data[3][0].carnet;
                  mailSrv.simpleMail(
                      "Simapla Digital <info@simapladigital.org>",
                      [req.param('pEmail')],
                      "Registro de cuenta",
                      '<h1>Simapla Digital</h1><p>Hola ' + req.param('pname') + " " + req.param('plastname')
                        + ',<br><br>Se ha registrado satisfactoriamente su cuenta.<br><br>Su carnet es: ' + req.session.me.carnet
                        + '<br><br>El equipo del SINEM de Mata de Plátano.</p>',
                      console.log("Email de registro enviado a " + req.param('pEmail')));
                  res.redirect('/perfil');
              } else {
                  res.redirect('/registro');
              }
          }
      });
    },

    signupMultiple: (req, res) => {
        role = req.param('role');
        console.log("LOG SignupController role: " + role);
      let values = [
        `'`+generateCarnet()+`'`,//generateCarnet(), // req.param('pcarnet'),
        `'${req.param('pcedula')}'`,
        `'${req.param('pname')}'`,
        `'${req.param('plastname')}'`,
        `'${req.param('pbirthdate')}'`,
        `'${req.param('ppassword')}'`,
        'NOW()',// req.param('pdateJoinedProgram'),
        `'${req.param('pSpecificAddress')}'`,
        `'${req.param('pEmail')}'`,
        `'${req.param('pPhone')}'`,
        req.param('pIdDistrict')
      ];
      if (role == 0) {
          roleName = "Student";
          values[values.length] = req.param('pIsLefty'),
          values[values.length] = req.param('pHasAdequacy'),
          values[values.length] = `'${req.param('pSpecialCondition')}'`,
          values[values.length] = `'${req.param('pMedication')}'`;
      } else if (role == 1) {
          roleName = "Administrator";
          values[values.length] = req.param('pposition');
      } else if (role == 2) {
          roleName = "Teacher";
          values[values.length] = req.param('pinstrument');
      } else if (role == 3) {
          roleName = "Responsible";
      } else {
          console.log("LOG SignupController ERROR: Invalid role received: " + role);
          res.redirect('/registro');
      }
        values = values.join(',');
        let query = `call SimaplaDb.register${roleName}(${values})`;
        console.log(query);
        connection.query(query, {}, res, (resObject, res) => {
            if (!resObject.error) {
                if (typeof resObject.data != 'undefined' && typeof resObject.data[3] != 'undefined'){
                    mailSrv.simpleMail(
                        "Simapla Digital <info@simapladigital.org>",
                        [req.param('pEmail')],
                        "Registro de cuenta",
                        '<h1>Simapla Digital</h1><p>Hola ' + req.param('pname') + " " + req.param('plastname')
                          + ',<br><br>Se ha registrado satisfactoriamente su cuenta.<br><br>Su carnet es: ' + resObject.data[3][0].carnet
                          + '<br><br>El equipo del SINEM de Mata de Plátano.</p>',
                        console.log("Email de registro enviado a " + req.param('pEmail')));
                    res.redirect('/registro'); // TODO: Al enviar, pasar aviso a la web de registro exitoso
                } else {
                    console.log("LOG SignupController Error: undefined resObject.data (Unexpected DB return) ");
                    res.redirect('/registro');
                }
            }
        });
    }
};


function generateCarnet(){
  let abc = 'abcdefghijklmnopqrstuv'.split('');
  let str = '';
  for (var i = 0; i < 3; i++)
    str += abc[Math.floor(Math.random()*abc.length)];
  return "mdp" + str;
}

let isFirstSignup = (res, first, notFirst) => {
  let query = `SELECT count(*) as count FROM Person;`;
  DbConnectionService.query(query, {}, res, (resObject, res, err) => {
    if (resObject.error) res.send(err);

    if (resObject.data.count > 0) first();
    else notFirst();
  });
};
