#!/usr/bin/env bash

# SYNOPSIS
#     A helper script for md-to-pdf with support for any theme in the config directory.
#
# PARAMETERS
#     $1 (Path): The path to the markdown file to convert.
#     $2 (Style): The name of the theme to use (e.g., nord-polar-night).
#                 Defaults to nord-polar-night.
#     $@ (AdditionalArgs): Any additional arguments passed to the script.

# Get the directory where the script is located, resolving symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Initialize variables
FILE_PATH=""
STYLE="nord-polar-night"
STYLE_SET=false
ADDITIONAL_ARGS=()

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--path)
            FILE_PATH="$2"
            shift 2
            ;;
        -s|--style)
            # Only set if the value is not empty
            if [[ -n "$2" ]]; then
                STYLE="$2"
                STYLE_SET=true
            fi
            shift 2
            ;;
        -*)
            # Any other flag goes to additional args
            ADDITIONAL_ARGS+=("$1")
            shift
            ;;
        *)
            # Positional arguments
            if [[ -z "$FILE_PATH" ]]; then
                FILE_PATH="$1"
                shift
            elif [[ "$STYLE_SET" == false ]]; then
                # Only set style if the argument is not empty
                if [[ -n "$1" ]]; then
                    STYLE="$1"
                    STYLE_SET=true
                fi
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

# Final fallback for STYLE
if [[ -z "$STYLE" ]]; then
    STYLE="nord-polar-night"
fi

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
