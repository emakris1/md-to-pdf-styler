const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#2e3440'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'nord-polar-night.css'),
  ],
};
