/**
 * GetController
 *
 * @description :: Server-side logic for managing posts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 sails.config.routes['DELETE /ws/delete'] = 'Ws/sample/DeleteController.delete';

module.exports = {
	// Can get parameters through the request's body and the query as well
	delete: (req, res) => {
  		res.json({bodyParams: req.body, queryParams: req.query});
    }
};
