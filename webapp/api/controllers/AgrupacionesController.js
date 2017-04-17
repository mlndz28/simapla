/**
 * AgrupacionesController
 *
 * @description :: Server-side logic for managing Agrupaciones
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	show: function(req, res) {
    return res.view('agrupaciones/ver');
  },
  create: function(req, res) {
    return res.view('agrupaciones/crear');
  },
  edit: function(req, res) {
    return res.view('agrupaciones/editar');
  },
};
