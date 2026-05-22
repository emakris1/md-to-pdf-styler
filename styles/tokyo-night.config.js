const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#1a1b26'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'tokyo-night.css'),
  ],
};
