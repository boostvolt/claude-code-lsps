#!/bin/bash

# Check if intelephense is installed and available in PATH

if command -v intelephense &> /dev/null; then
    exit 0
fi

# Check if npm is available
if command -v npm &> /dev/null; then
    echo "[wordpress-intelephense] Installing intelephense via npm..."
    npm install -g intelephense

    if command -v intelephense &> /dev/null; then
        echo "[wordpress-intelephense] Installed successfully"
        exit 0
    fi
fi

# Manual instructions
echo "[wordpress-intelephense] intelephense is not installed."
echo "          Install: npm install -g intelephense"

exit 0
