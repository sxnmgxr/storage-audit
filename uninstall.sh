#!/bin/bash

# System Insight Uninstaller
set -e

SCRIPT_NAME="sysinsight"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/sysinsight"

echo "Uninstalling System Insight..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root for uninstallation"
    exit 1
fi

# Remove main script
if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    echo "Removing $INSTALL_DIR/$SCRIPT_NAME..."
    rm "$INSTALL_DIR/$SCRIPT_NAME"
fi

# Remove config directory
if [ -d "$CONFIG_DIR" ]; then
    echo "Removing configuration directory $CONFIG_DIR..."
    rm -rf "$CONFIG_DIR"
fi

echo "Uninstallation completed successfully!"