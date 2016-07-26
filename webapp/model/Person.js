const _ = require('lodash');
const crypto = require('crypto');

// SHOULD ACCEPT ALL PROPERTIES AS PARAMS
function Person() {
      /**
       * The perosn's id.
       * @type {Number}
       */
  var idPerson = 0

      /**
       * The person's carnet.
       * @type {String}
       */
      , carnet = ''

      /**
       * The person's cedula.
       * @type {String}
       */
      , cedula = ''

      /**
       * The person's name.
       * @type {String}
       */
      , name = ''

      /**
       * The person's last name.
       * @type {String}
       */
      , lastname = ''

      /**
       * The person's birthdate.
       * @type {Object}
       */
      , birthdate = {}

      /**
       * The person's password.
       * @type {String}
       */
      , password = ''

      /**
       * The person's address id number.
       * @type {Number}
       */
      , idSpecificAddress = 0

      /**
       * The person's join date to program.
       * @type {Object}
       */
      , dateJoinedProgram = {}

      /**
       * The person's addresses.
       * @type {Array}
       */
      , address = []

      /**
       * The person's emails.
       * @type {Array}
       */
      , email = []

      /**
       * The person's groups.
       * @type {Array}
       */
      , group = []

      /**
       * The person's phones.
       * @type {Array}
       */
      , phone = []
      ;

  function constructor() {
    // SHOULED ACCEPT ALL PARAMETERS.
  }
  constructor();

  /**
   * Hashes the password with given salt, note that a Person should not have
   * knowledge about it's password, but rather the hashed password.
   * @param  {String} pass The person's real password.
   * @param  {String} salt The person's salt to hash the password.
   * @return {String}      The hashed password or an empty string if either of
   *                       the arguments is empty or is not a string.
   */
  function hashPassword(pass, salt) {
    const hash = crypto.createHash('sha256');
    pass = _.isString(pass)? pass: '';
    salt = _.isString(salt)? salt: '';
    hash.update(salt + pass);
    var hashed = pass === '' || salt === ''? hash.digest('hex'): '';
    return hashed;
  };

  /**
   * Generates a random salt for a new user.
   * @return {String} The salt which is a hex value.
   */
  function generateSalt() {
    var randomBytes = crypto.randomBytes(16);
    return randomBytes.toString('hex');
  }

  this.setId(id) {
    id = _.toSafeInteger(id);
  }

  this.setPassword(pass) {
    var salt = generateSalt();
    pass = hashPassword(pass, salt);
  }

  this.setPasswordWithSalt(pass, salt) {
    pass = hashPassword(pass, salt);
  }
  
  this.setHashedPassword(pass) {
    pass = pass;
  }
}
