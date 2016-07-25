var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Simapla' });
});

router.get('/login', function(req, res, next) {
  res.render('login', { title: 'Simapla' });
});

module.exports = router;
