/**
 * GetController
 *
 * @description :: Server-side logic for managing gets
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 sails.config.routes['GET /ws/get'] = 'Ws/sample/GetController.get';

module.exports = {
	// Can get parameters through the request's query
	get: (req, res) => {
  		res.json({queryParams: req.query});
    }
};
