const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#2d353b'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'everforest-dark.css'),
  ],
};
