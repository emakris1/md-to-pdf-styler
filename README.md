# md-to-pdf-styler

A robust, cross-platform collection of modern themes and helper scripts for `md-to-pdf`. Generate beautiful, professionally styled PDFs from Markdown with ease.

## Features

- **16+ Modern Themes**: Includes popular palettes like Tokyo Night, Catppuccin, Nord, Everforest, and more.
- **Cross-Platform Support**: Robust Bash and PowerShell helper scripts.
- **Header/Footer Integration**: Automatic color-matching for PDF headers and footers.
- **Syntax Highlighting**: Pre-configured styles for common code blocks.
- **DRY Architecture**: Shared base styles and configurations for easy maintenance and extension.
- **Testing Suite**: Quick verification of all themes against a sample document.

## Available Themes

| Theme Family | Dark Variant(s) | Light Variant(s) |
| :--- | :--- | :--- |
| **Tokyo Night** | `tokyo-night` | `tokyo-day` |
| **Rosé Pine** | `rose-pine` | `rose-pine-dawn` |
| **Everforest** | `everforest-dark` | `everforest-light` |
| **Kanagawa** | `kanagawa-wave` | `kanagawa-lotus` |
| **Ayu** | `ayu-dark` | `ayu-light` |
| **Catppuccin** | `catppuccin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato` | `catppuccin-latte` |
| **Nord** | `nord-polar-night` | `nord-snow-storm` |

## Prerequisites

- [Node.js](https://nodejs.org/)
- [md-to-pdf](https://www.npmjs.com/package/md-to-pdf) installed globally:
  ```bash
  npm install -g md-to-pdf
  ```

## Usage

### PowerShell (Windows)
The script supports both named and positional parameters.

**Default (Nord Polar Night):**
```powershell
.\md-to-pdf-styled.ps1 .\my-doc.md
```

**Positional Parameters:**
```powershell
.\md-to-pdf-styled.ps1 .\my-doc.md tokyo-night
```

**Named Parameters:**
```powershell
.\md-to-pdf-styled.ps1 -Path .\my-doc.md -Style kanagawa-wave
```

**Additional Arguments to `md-to-pdf` (e.g., watch mode):**
```powershell
.\md-to-pdf-styled.ps1 .\my-doc.md tokyo-night --watch
```

### Bash (macOS/Linux)
The script supports flags and positional arguments.

**Default (Nord Polar Night):**
```bash
./md-to-pdf-styled.sh my-doc.md
```

**Positional Arguments:**
```bash
./md-to-pdf-styled.sh my-doc.md tokyo-night
```

**Named Flags:**
```bash
./md-to-pdf-styled.sh --path my-doc.md --style everforest-dark
```

**Additional Arguments to `md-to-pdf` (e.g., watch mode):**
```bash
./md-to-pdf-styled.sh my-doc.md tokyo-night --watch
```


## Testing Themes
To see how all themes look, you can run the provided test suite:

### PowerShell (Windows)
```powershell
.\test\test_themes.ps1
```

### Bash (macOS/Linux)
```bash
./test/test_themes.sh
```

This will generate a sample PDF for every theme in `test/pdfs/` using the `test/test.md` file.

## Customization

To add a new theme:
1. Create a new CSS file in `styles/` (e.g., `my-theme.css`) and define the required `:root` variables.
2. Create a corresponding `.config.js` file (see existing themes for the 3-line template).
3. The helper scripts will automatically pick up the new theme.
