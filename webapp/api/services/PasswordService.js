const bcrypt = require('bcrypt');

/**
 * Encripta una contraseña.
 * @param  {string}   password Contraseña que se encripta.
 * @param  {Function} callback Funcion que se llama al haber encriptado la
 *                             contraseña.
 */
exports.cryptPassword = (password, callback) => {
   bcrypt.genSalt(10, (err, salt) => {
    if (err) return callback(err);
    bcrypt.hash(password, salt, (err, hash) => { return callback(err, hash); });
  });
};

/**
 * Compara la contraseña almacenada(encriptada) con el texto de la contraseña.
 * @param  {String}   password     Texto de la contraseña sin encriptar.
 * @param  {[type]}   userPassword Contraseña encriptada.
 * @param  {Function} callback     Función que se llama al haber comparado la
 *                                 contraseña.
 */
exports.comparePassword = (password, userPassword, callback) => {
   bcrypt.compare(password, userPassword, (err, isPasswordMatch) => {
      if (err) return callback(err);
      return callback(null, isPasswordMatch);
   });
};
