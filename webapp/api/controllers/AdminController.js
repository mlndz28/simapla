/**
 * AdminController
 *
 * @description :: Server-side logic for managing admins
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	show: (req, res) => {
		console.log(req.session);
		if (req.session.logged) {
			return res.view('admin');
		} else {
			return res.redirect('login');
		}
	}
};
