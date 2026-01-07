#!/bin/bash

# Check if bash-language-server is installed and available in PATH

if command -v bash-language-server &> /dev/null; then
    exit 0
fi

# Try brew first
if command -v brew &> /dev/null; then
    echo "[bash-language-server] Installing via Homebrew..."
    brew install bash-language-server

    if command -v bash-language-server &> /dev/null; then
        echo "[bash-language-server] Installed successfully"
    else
        echo "[bash-language-server] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

# Try npm
if command -v npm &> /dev/null; then
    echo "[bash-language-server] Installing via npm..."
    npm install -g bash-language-server

    if command -v bash-language-server &> /dev/null; then
        echo "[bash-language-server] Installed successfully"
    else
        echo "[bash-language-server] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[bash-language-server] Not installed. Install via:"
echo "                       brew install bash-language-server"
echo "                       npm install -g bash-language-server"

exit 0
