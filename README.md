# Markdown to PDF Styler
Modern, visually interesting stylesheets for use with [md-to-pdf](https://github.com/simonhaenisch/md-to-pdf) along with convenient helper scripts for bootstrapping your `md-to-pdf` calls to use them.

## Using the Helper Scripts

For convenience, helper scripts are provided to run the generation with the required arguments for utilizing the configs and stylesheets automatically.
They default to the `nord-polar-night` theme.

### PowerShell (Windows)
```powershell
# Basic usage (defaults to Nord Polar Night)
.\md-to-pdf-styled.ps1 my-document.md

# Specify a different style (e.g., Nord Snow Storm)
.\md-to-pdf-styled.ps1 my-document.md nord-snow-storm

# Using named parameters
.\md-to-pdf-styled.ps1 -Path my-document.md -Style catppuccin-mocha

# Passing additional arguments (e.g., watch mode)
.\md-to-pdf-styled.ps1 my-document.md catppuccin-latte --watch
```

### Bash (Linux/macOS)
```bash
# Basic usage (defaults to Nord Polar Night)
./md-to-pdf-styled.sh my-document.md

# Specify a different style (e.g., Nord Snow Storm)
./md-to-pdf-styled.sh my-document.md nord-snow-storm

# Using named parameters
./md-to-pdf-styled.sh --path my-document.md --style catppuccin-mocha

# Passing additional arguments
./md-to-pdf-styled.sh my-document.md catppuccin-latte --watch
```

## Manual Usage

To manually generate a PDF using these styles with `md-to-pdf` directly, use the following command structure:
```
md-to-pdf <markdown-file> --config-file "styles/<theme-name>.config.js" --stylesheet "styles/<theme-name>.css"
```

## Available Themes

All available themes are located in the `styles/` directory.
Each theme consists of a `.css` file for styling and a `.config.js` file for engine-level configuration (header/footer templates).

### Adding Custom Themes
The helper scripts can use any theme provided you create two files in the `styles` directory:
1.  `theme-name.css`: The stylesheet.
2.  `theme-name.config.js`: The configuration file.

Once created, you can use it with: `./md-to-pdf-styled.sh doc.md theme-name`.
