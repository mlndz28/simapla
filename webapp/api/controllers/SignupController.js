/**
 * SignupController
 *
 * @description :: Server-side logic for managing signups
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	show: (req, res) => {
		return res.view('signup');
	}
};
