const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#f2ecbc'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'kanagawa-lotus.css'),
  ],
};
