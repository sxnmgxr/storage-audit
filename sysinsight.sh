#!/bin/bash

# System Insight - Comprehensive Storage and Memory Analysis Tool
# Version: 1.0.0
# Author: Sujan
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
MAX_DEPTH="${DEFAULT_MAX_DEPTH:-2}"

print_header() {
    echo -e "\n${CYAN}===============================================${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}===============================================${NC}"
}

check_disk_space() {
    print_header "Disk Usage Summary"
    df -h --total | awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}'
}

check_memory_usage() {
    print_header "Memory Usage Summary"
    free -h
}

find_large_directories() {
    print_header "Largest Directories in $SCAN_DIR"
    du -h --max-depth=$MAX_DEPTH "$SCAN_DIR" 2>/dev/null | sort -hr | head -n 15
}

find_large_files() {
    print_header "Largest Files in $SCAN_DIR"
    find "$SCAN_DIR" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 15
}

generate_summary() {
    print_header "Overall System Summary"
    echo -e "${YELLOW}Top Processes by Memory:${NC}"
    ps aux --sort=-%mem | head -n 10
}

main() {
    echo -e "${PURPLE}"
    echo "  ╔══════════════════════════════════════════════╗"
    echo "  ║          SYSTEM INSIGHT AUDIT REPORT         ║"
    echo "  ║     Storage and Memory Analyzer v$VERSION       ║"
    echo "  ╚══════════════════════════════════════════════╝"
    echo -e "${NC}"

    echo -e "Generated on: $(date)"
    echo -e "Hostname: $(hostname)\n"

    check_disk_space
    check_memory_usage
    find_large_directories "$SCAN_DIR" "$MAX_DEPTH"
    find_large_files "$SCAN_DIR"
    generate_summary
}

main "$@"
