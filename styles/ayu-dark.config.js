const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#0f1419'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'ayu-dark.css'),
  ],
};
