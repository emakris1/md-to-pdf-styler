const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#fdf6e3'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'everforest-light.css'),
  ],
};
