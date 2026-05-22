<#
.SYNOPSIS
    A helper script for md-to-pdf with support for any theme in the config directory.

.PARAMETER Path
    The path to the markdown file to convert.

.PARAMETER Style
    The name of the theme to use (e.g., nord-polar-night).
    Requires corresponding .css and .config.js files in the styles subdirectory.
    Defaults to nord-polar-night.

.EXAMPLE
    .\md-to-pdf-styled.ps1 .\document.md
    Converts document.md using the default Nord Polar Night theme.

.EXAMPLE
    .\md-to-pdf-styled.ps1 .\document.md my-theme-name
    Converts document.md using 'styles/my-theme-name.css' and 'styles/my-theme-name.config.js'.
#>
param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Path,

    [Parameter(Position=1)]
    [string]$Style = "nord-polar-night",

    [Parameter(ValueFromRemainingArguments=$true)]
    $AdditionalArgs
)

# Fallback for Style if empty string is provided
if ([string]::IsNullOrWhiteSpace($Style)) {
    $Style = "nord-polar-night"
}

$StylesDir = Join-Path $PSScriptRoot "styles"
$ConfigPath = Join-Path $StylesDir "$Style.config.js"
$StylePath = Join-Path $StylesDir "$Style.css"

# Check if markdown file exists
if (-not (Test-Path $Path)) {
    Write-Error "Could not find file: $Path"
    exit 1
}

# Check if theme files exist
if (-not (Test-Path $ConfigPath) -or -not (Test-Path $StylePath)) {
    Write-Error "Theme '$Style' files not found in $StylesDir"
    exit 1
}

Write-Host "Generating PDF using $Style theme..." -ForegroundColor Cyan

# Prepare the command array
$cmdArgs = @(
    $Path,
    "--config-file", $ConfigPath
)
# Append any additional arguments passed to the script
if ($AdditionalArgs) {
    $cmdArgs += $AdditionalArgs
}

# Execute md-to-pdf
md-to-pdf @cmdArgs
