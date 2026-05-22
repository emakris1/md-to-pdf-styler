module.exports = {
  pdf_options: {
    format: 'A4',
    margin: {
      top: '15mm',
      bottom: '15mm',
      left: '0',
      right: '0',
    },
    displayHeaderFooter: true,
    headerTemplate: `
      <style>
        #header { padding: 0 !important; margin: 0 !important; -webkit-print-color-adjust: exact; }
      </style>
      <div style="background-color: #e1e2e7; width: 100%; height: 15mm;"></div>`,
    footerTemplate: `
      <style>
        #footer { padding: 0 !important; margin: 0 !important; -webkit-print-color-adjust: exact; }
      </style>
      <div style="background-color: #e1e2e7; width: 100%; height: 15mm;"></div>`,
    printBackground: true,
  },
  stylesheet_encoding: 'utf-8',
};
