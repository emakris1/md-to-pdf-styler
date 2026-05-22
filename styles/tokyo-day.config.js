const base = require('./base.config.js');
const path = require('path');

module.exports = {
  ...base,
  pdf_options: base.getOptions('#e1e2e7'),
  stylesheet: [
    path.join(__dirname, 'base.css'),
    path.join(__dirname, 'tokyo-day.css'),
  ],
};
