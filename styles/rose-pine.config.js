const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#191724'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'rose-pine.css'),
  ],
};
