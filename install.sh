#!/bin/bash

# Install managed-settings.json for ClaudeCode
# This script requires sudo privileges

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/settings/managed-settings.json"
DEST_DIR="/Library/Application Support/ClaudeCode"
DEST_FILE="$DEST_DIR/managed-settings.json"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file not found: $SOURCE_FILE"
    exit 1
fi

# Create destination directory if it doesn't exist
echo "Creating directory: $DEST_DIR"
sudo mkdir -p "$DEST_DIR"

# Copy the managed-settings.json file
echo "Installing managed-settings.json..."
sudo cp "$SOURCE_FILE" "$DEST_FILE"

# Set appropriate permissions
sudo chmod 644 "$DEST_FILE"
sudo chown root:wheel "$DEST_FILE"

echo "Successfully installed $DEST_FILE"
echo ""
echo "Installed settings:"
echo "=================="
sudo cat "$DEST_FILE"