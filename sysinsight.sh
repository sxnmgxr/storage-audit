#!/bin/bash

# System Insight - Comprehensive Storage and Memory Analysis Tool
# Version: 1.0.0
# Author: Your Name
# License: MIT

# Configuration
SCRIPT_NAME="sysinsight"
VERSION="1.0.0"
CONFIG_FILE="$(dirname "$0")/config.cfg"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Load configuration if exists
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"

# Default configuration
SCAN_DIR="${DEFAULT_SCAN_DIR:-/home}"
TOP_N="${DEFAULT_TOP_N:-10}"
MAX_DEPTH="${DEFAULT_MAX_DEPTH:-2}"
SHOW_WARNINGS="${SHOW_WARNINGS:-true}"

print_header() {
    echo -e "\n${CYAN}===============================================${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}===============================================${NC}"
}

# [Rest of the functions from previous code...]
# check_disk_space(), check_memory_usage(), find_large_directories(), etc.

main() {
    echo -e "${PURPLE}"
    echo "   _____ _           _   _       _     _   "
    echo "  / ____| |         | | (_)     | |   (_)  "
    echo " | (___ | |_ _   _  | |_ _ _ __ | |__  _   "
    echo "  \___ \| __| | | | | __| | '_ \| '_ \| |  "
    echo "  ____) | |_| |_| | | |_| | |_) | | | | |  "
    echo " |_____/ \__|\__, |  \__|_| .__/|_| |_|_|  "
    echo "              __/ |       | |              "
    echo "             |___/        |_|              "
    echo -e "${NC}"
    
    echo -e "System Storage and Memory Analysis Tool v$VERSION"
    echo -e "Generated on: $(date)"
    echo -e "Hostname: $(hostname)\n"
    
    check_disk_space
    check_memory_usage
    find_large_directories "$SCAN_DIR" "$MAX_DEPTH" "$TOP_N"
    find_large_files "$SCAN_DIR" "$TOP_N"
    generate_summary
}

# [Include all other functions from previous implementation]
# [Argument parsing, help function, etc.]

# Run main function with error handling
main "$@"