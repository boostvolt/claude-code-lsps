#!/bin/bash

# Check if terraform-ls is installed and available in PATH

if command -v terraform-ls &> /dev/null; then
    exit 0
fi

# Try brew
if command -v brew &> /dev/null; then
    echo "[terraform-ls] Installing via Homebrew..."
    brew install terraform-ls

    if command -v terraform-ls &> /dev/null; then
        echo "[terraform-ls] Installed successfully"
    else
        echo "[terraform-ls] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[terraform-ls] Not installed. Install via:"
echo "               brew install terraform-ls"
echo ""
echo "               Or download from: https://github.com/hashicorp/terraform-ls/releases"

exit 0
