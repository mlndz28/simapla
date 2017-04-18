/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes map URLs to views and controllers.
 *
 * If Sails receives a URL that doesn't match any of the routes below,
 * it will check for matching files (images, scripts, stylesheets, etc.)
 * in your assets directory.  e.g. `http://localhost:1337/images/foo.jpg`
 * might match an image file: `/assets/images/foo.jpg`
 *
 * Finally, if those don't match either, the default 404 handler is triggered.
 * See `api/responses/notFound.js` to adjust your app's 404 logic.
 *
 * Note: Sails doesn't ACTUALLY serve stuff from `assets`-- the default Gruntfile in Sails copies
 * flat files from `assets` to `.tmp/public`.  This allows you to do things like compile LESS or
 * CoffeeScript for the front-end.
 *
 * For more information on configuring custom routes, check out:
 * http://sailsjs.org/#!/documentation/concepts/Routes/RouteTargetSyntax.html
 */

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` (or `views/homepage.jade`, *
  * etc. depending on your default view engine) your home page.              *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/

  '/': 'homepageController.show',

  'GET /login': 'LoginController.show',
  'POST /login': 'LoginController.login',
  '/logout': 'LoginController.logout',

  'GET /registro': 'SignupController.show',

  'GET /admin': 'AdminController.show',

  'GET /agrupaciones': 'AgrupacionesController.show',
  'GET /agrupaciones/crear': 'AgrupacionesController.create',
  'GET /agrupaciones/editar': 'AgrupacionesController.edit',

  'GET /ws/administrator': 'Ws/AdministratorController.get',

  'GET /ws/countries': 'Ws/DistrictController.getCountries',
  'GET /ws/provinces/:countryId': 'Ws/DistrictController.getProvinces',
  'GET /ws/cantons/:provinceId': 'Ws/DistrictController.getCantons',
  'GET /ws/districts/:cantonId': 'Ws/DistrictController.getDisctricts',

  'GET /ws/instruments': 'Ws/InstrumentController.getInstruments',

  'GET /ws/me': 'Ws/MyselfController.get',

  'GET /ws/user/:carnet': 'Ws/PersonController.get',
  'POST /ws/user': 'Ws/PersonController.post',
  'PUT /ws/user': 'Ws/PersonController.put',
  'DELETE /ws/user': 'Ws/PersonController.delete',

  'GET /:folder/*': 'FlatController.serve',


};
