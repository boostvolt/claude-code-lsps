#!/bin/bash

# Check if yaml-language-server is installed and available in PATH

if command -v yaml-language-server &> /dev/null; then
    exit 0
fi

# Try brew first
if command -v brew &> /dev/null; then
    echo "[yaml-language-server] Installing via Homebrew..."
    brew install yaml-language-server

    if command -v yaml-language-server &> /dev/null; then
        echo "[yaml-language-server] Installed successfully"
    else
        echo "[yaml-language-server] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

# Try npm
if command -v npm &> /dev/null; then
    echo "[yaml-language-server] Installing via npm..."
    npm install -g yaml-language-server

    if command -v yaml-language-server &> /dev/null; then
        echo "[yaml-language-server] Installed successfully"
    else
        echo "[yaml-language-server] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[yaml-language-server] Not installed. Install via:"
echo "                       brew install yaml-language-server"
echo "                       npm install -g yaml-language-server"

exit 0
