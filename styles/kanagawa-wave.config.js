const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#1f1f28'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'kanagawa-wave.css'),
  ],
};
