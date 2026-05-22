#!/usr/bin/env bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STYLES_DIR="$PROJECT_ROOT/styles"
TEST_MD="$SCRIPT_DIR/test.md"
OUTPUT_DIR="$SCRIPT_DIR/pdfs"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Check if test.md exists
if [ ! -f "$TEST_MD" ]; then
    echo "Error: Could not find $TEST_MD"
    exit 1
fi

echo "Starting theme tests..."

# Iterate through all .css files in the styles directory (excluding base.css)
for theme_file in "$STYLES_DIR"/*.css; do
    # Get the theme name by removing path and extension
    theme_name=$(basename "$theme_file" .css)
    
    if [[ "$theme_name" == "base" ]]; then
        continue
    fi

    echo "Testing theme: $theme_name"

    # Run the styled conversion script
    "$PROJECT_ROOT/md-to-pdf-styled.sh" "$TEST_MD" "$theme_name"

    # md-to-pdf generates test.pdf in the same dir as test.md
    generated_pdf="$SCRIPT_DIR/test.pdf"

    if [ -f "$generated_pdf" ]; then
        # Rename and move to output directory
        mv "$generated_pdf" "$OUTPUT_DIR/test-$theme_name.pdf"
        echo "Success: Generated $OUTPUT_DIR/test-$theme_name.pdf"
    else
        echo "Error: Failed to generate PDF for theme $theme_name"
    fi
done

echo "Theme testing complete. Results are in $OUTPUT_DIR"
