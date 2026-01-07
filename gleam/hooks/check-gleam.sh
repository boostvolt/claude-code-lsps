#!/bin/bash

# Check if gleam is installed and available in PATH

if command -v gleam &> /dev/null; then
    exit 0
fi

# Try brew
if command -v brew &> /dev/null; then
    echo "[gleam] Installing via Homebrew..."
    brew install gleam

    if command -v gleam &> /dev/null; then
        echo "[gleam] Installed successfully"
    else
        echo "[gleam] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[gleam] Not installed. Install via:"
echo "        brew install gleam"
echo ""
echo "        Or see: https://gleam.run/getting-started/installing/"

exit 0
