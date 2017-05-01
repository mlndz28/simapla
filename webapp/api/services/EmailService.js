/*  Ejemplo del objeto del correo
    {
    from: "SINEM Mata de Plátano <info@simapladigital.org>",
    to: ["receptor@gmail.com"],
    subject: "Asunto del correo",
    html: "<h1>Correo automático</h1><p>By Hackerman.</p>"
    }

    https://github.com/mailgun/mailgun-js
*/


const mailgun = require('mailgun.js');
const mg = mailgun.client({
    username: 'api',
    key: process.env.MAILGUN_API_KEY || 'key-526be85912f6fe6411085405a77f8e1f'});

/**
 * Envía un correo con mínimo de parámetros.
 * @param  {string}   pFrom     Correo emisor
 * @param  {string[]} pTo       Correos receptores
 * @param  {string}   pSubject  Asunto
 * @param  {string}   pHtml     Contenido del correo
 * @param  {Function} callback  Funcion que se llama al haber encriptado la
 *                              contraseña.
 */
exports.simpleMail = (pFrom, pTo, pSubject, pHtml, callback) => {
    mg.messages.create('sandbox83bdd9fb06a64990bed8f5d7c4b15e9b.mailgun.org', {
    from: pFrom,
    to: pTo,
    subject: pSubject,
    html: pHtml
  })
  .then(msg => console.log(msg)) // logs response data
  .catch(err => console.log(err)); // logs any error
};

/**
* Envía un correo con los parámetros que reciba.
* @param  {json}   data     Parámetros del correo. Emisor, receptor,
                              contenido, asunto, etc...
* @param  {Function} callback Funcion que se llama al haber encriptado la
*                             contraseña.
*/
exports.complexMail = (data, callback) => {
    mg.messages.create('sandbox83bdd9fb06a64990bed8f5d7c4b15e9b.mailgun.org', data)
    .then(msg => console.log(msg)) // logs response data
    .catch(err => console.log(err)); // logs any error
};
