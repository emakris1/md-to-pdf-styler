<#
.SYNOPSIS
    Test script to generate a PDF for every theme in the styles directory.
#>

$ProjectRoot = Resolve-Path "$PSScriptRoot\.."
$StylesDir = Join-Path $ProjectRoot "styles"
$TestMd = Join-Path $PSScriptRoot "test.md"
$OutputDir = Join-Path $PSScriptRoot "pdfs"

# Ensure output directory exists
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

if (-not (Test-Path $TestMd)) {
    Write-Error "Could not find $TestMd"
    return
}

Write-Host "Starting theme tests..." -ForegroundColor Green

# Get all theme names from .css files
$Themes = Get-ChildItem -Path $StylesDir -Filter "*.css" | Select-Object -ExpandProperty BaseName

foreach ($Theme in $Themes) {
    Write-Host "Testing theme: $Theme" -ForegroundColor Cyan

    # Run the styled conversion script
    & "$ProjectRoot\md-to-pdf-styled.ps1" -Path $TestMd -Style $Theme

    # md-to-pdf generates test.pdf in the same dir as test.md
    $GeneratedPdf = Join-Path $PSScriptRoot "test.pdf"

    if (Test-Path $GeneratedPdf) {
        $DestPath = Join-Path $OutputDir "test-$Theme.pdf"
        # Overwrite if exists
        Move-Item -Path $GeneratedPdf -Destination $DestPath -Force
        Write-Host "Success: Generated $DestPath" -ForegroundColor Gray
    }
    else {
        Write-Error "Failed to generate PDF for theme $Theme"
    }
}

Write-Host "Theme testing complete. Results are in $OutputDir" -ForegroundColor Green
