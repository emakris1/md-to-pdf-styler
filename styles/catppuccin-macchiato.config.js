const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#24273a'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'catppuccin-macchiato.css'),
  ],
};
