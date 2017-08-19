/**
 * GetController
 *
 * @description :: Server-side logic for managing posts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 sails.config.routes['PUT /ws/put'] = 'Ws/sample/PutController.put';

module.exports = {
	// Can get parameters through the request's body and the query as well
	put: (req, res) => {
  		res.json({bodyParams: req.body, queryParams: req.query});
    }
};
