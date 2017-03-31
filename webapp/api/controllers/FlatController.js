/**
 * FlatController
 *
 * @description :: Serves Static files if folder is allowed.
 */

const path = require('path');

module.exports = {
  serve: (req, res) => {
    if (req.params.folder.match(/css|data|dist|font-awesome|fonts|img|js|vendor/)) {
      return res.sendfile(`templates/${req.path}`);
    }
    return res.redirect('/');
  }
};
