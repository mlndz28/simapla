

module.exports = {
	show: (req, res) => {
		return res.view('homepage', {title:'Simapla Digital - Inicio', logged:req.session.logged});
	}
};
