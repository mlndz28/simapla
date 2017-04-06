/**
 * FlatController
 *
 * @description :: Serves Static files if folder is allowed.
 */

const path = require('path');

module.exports = {
  serve: (req, res, next) => {
    let re = /css|data|dist|font-awesome|fonts|img|js|vendor/;
    if (req.params.folder.match(re)) {
      return res.sendfile(`templates/${req.path}`);
    }
    return next();
  }
};
