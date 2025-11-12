#!/bin/bash

# System Insight Installer
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="sysinsight"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/sysinsight"

echo "Installing System Insight..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root for system-wide installation"
    exit 1
fi

# Copy main script
echo "Installing main script to $INSTALL_DIR/$SCRIPT_NAME..."
cp "$SCRIPT_DIR/sysinsight.sh" "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Create config directory
echo "Creating configuration directory $CONFIG_DIR..."
mkdir -p "$CONFIG_DIR"

# Copy default config if it exists
if [ -f "$SCRIPT_DIR/config.cfg" ]; then
    cp "$SCRIPT_DIR/config.cfg" "$CONFIG_DIR/"
fi

echo "Installation completed successfully!"
echo "You can now run: $SCRIPT_NAME"