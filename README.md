# Markdown to PDF Styler
Custom Stylesheets for `md-to-pdf` with a helper script to bootstrap your md-to-pdf call to use them.

This repository contains modern, visually interesting stylesheets for use with [md-to-pdf](https://github.com/simonhaenisch/md-to-pdf), fully aligned with the [Nord](https://www.nordtheme.com/) color palette.

## Quick Start (Helper Script)

For convenience, a PowerShell script is provided to run the generation with the required arguments automatically. It defaults to the `nord-polar-night` theme.

```powershell
# Basic usage (defaults to Nord Polar Night)
.\md-to-pdf-styled.ps1 my-document.md

# Specify a different style (Nord Snow Storm)
.\md-to-pdf-styled.ps1 my-document.md nord-snow-storm

# Passing additional arguments (e.g., watch mode)
.\md-to-pdf-styled.ps1 my-document.md nord-polar-night --watch

# Using named arguments for extra flags
.\md-to-pdf-styled.ps1 my-document.md nord-polar-night -AdditionalArgs "--watch --basedir ."
```

## Available Themes

- `nord-polar-night`: A deep Nord-inspired dark theme with Roboto typography.
- `nord-snow-storm`: A crisp Nord-inspired light theme with Roboto typography.

### Adding Custom Themes
The `md-to-pdf-styled.ps1` script can use any theme provided you create two files in the `styles` directory:
1.  `my-theme-name.css`: The stylesheet.
2.  `my-theme-name.config.js`: The configuration file (containing header/footer templates to prevent white borders).

Once created, you can use it with: `.\md-to-pdf-styled.ps1 doc.md my-theme-name`.

## How to Use (Manual)

To achieve a perfect, full-bleed PDF without white borders and with consistent 15mm spacing on every page, use the following commands:

### Nord Polar Night Theme
```powershell
md-to-pdf document.md --config-file "styles/nord-polar-night.config.js" --stylesheet "styles/nord-polar-night.css"
```

### Nord Snow Storm Theme
```powershell
md-to-pdf document.md --config-file "styles/nord-snow-storm.config.js" --stylesheet "styles/nord-snow-storm.css"
```

## Troubleshooting
- **White Borders:** If you see white borders, ensure you are using the `--config-file` flag (or use the helper script). Standard CSS cannot color the engine-level margins without the header/footer templates provided in the config files.
- **Inconsistent Padding:** If page 2+ has different padding than page 1, ensure you are using the config file which uses header/footer templates to simulate margins.
- **Excessive Spacing:** If the first page has too much space, check your Markdown. The theme automatically removes the top margin of the first element in the document to align it with the page margin.

## Customization
Feel free to edit the CSS files to adjust colors (defined in `:root`) or typography. The header/footer colors in the `.config.js` files should be updated if you change the primary background colors in the CSS.
