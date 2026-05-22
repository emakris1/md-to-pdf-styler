#!/usr/bin/env bash

# SYNOPSIS
#     A helper script for md-to-pdf with support for any theme in the config directory.
#
# PARAMETERS
#     $1 (Path): The path to the markdown file to convert.
#     $2 (Style): The name of the theme to use (e.g., nord-polar-night).
#                 Defaults to nord-polar-night.
#     $@ (AdditionalArgs): Any additional arguments passed to the script.

# Initialize variables
FILE_PATH=""
STYLE="nord-polar-night"
ADDITIONAL_ARGS=()

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--path)
            FILE_PATH="$2"
            shift 2
            ;;
        -s|--style)
            STYLE="$2"
            shift 2
            ;;
        *)
            # If FILE_PATH is not set, treat the first positional arg as Path
            if [[ -z "$FILE_PATH" ]]; then
                FILE_PATH="$1"
                shift
            # If STYLE is not set (and is still default), treat the second positional arg as Style
            elif [[ "$STYLE" == "nord-polar-night" ]]; then
                STYLE="$1"
                shift
            else
                ADDITIONAL_ARGS+=("$1")
                shift
            fi
            ;;
    esac
done

if [[ -z "$FILE_PATH" ]]; then
    echo "Error: Missing mandatory parameter 'Path'."
    echo "Usage: $0 <Path> [Style] [AdditionalArgs...]"
    echo "   or: $0 --path <Path> [--style <Style>] [AdditionalArgs...]"
    exit 1
fi

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STYLES_DIR="$SCRIPT_DIR/styles"
CONFIG_PATH="$STYLES_DIR/$STYLE.config.js"
STYLE_PATH="$STYLES_DIR/$STYLE.css"

# Check if markdown file exists
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: Could not find file: $FILE_PATH" >&2
    exit 1
fi

# Check if theme files exist
if [ ! -f "$CONFIG_PATH" ] || [ ! -f "$STYLE_PATH" ]; then
    echo "Error: Theme '$STYLE' files not found in $STYLES_DIR" >&2
    exit 1
fi

# Cyan color using ANSI escape codes
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}Generating PDF using $STYLE theme...${NC}"

# Execute md-to-pdf
md-to-pdf "$FILE_PATH" --config-file "$CONFIG_PATH" --stylesheet "$STYLE_PATH" "${ADDITIONAL_ARGS[@]}"
