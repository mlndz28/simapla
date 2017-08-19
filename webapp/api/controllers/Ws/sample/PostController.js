/**
 * GetController
 *
 * @description :: Server-side logic for managing posts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 sails.config.routes['POST /ws/post'] = 'Ws/sample/PostController.post';

module.exports = {
	// Can get parameters through the request's body and the query as well
	post: (req, res) => {
  		res.json({bodyParams: req.body, queryParams: req.query});
    }
};
