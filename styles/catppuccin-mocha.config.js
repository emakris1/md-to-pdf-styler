const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#1e1e2e'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'catppuccin-mocha.css'),
  ],
};
