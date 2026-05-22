const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#eff1f5'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'catppuccin-latte.css'),
  ],
};
