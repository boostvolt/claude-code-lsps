#!/bin/bash

# Check if lua-language-server is installed and available in PATH

if command -v lua-language-server &> /dev/null; then
    # lua-language-server is installed, exit silently
    exit 0
fi

# Check if brew is available
if command -v brew &> /dev/null; then
    echo "[lua-language-server] Installing via Homebrew..."
    brew install lua-language-server

    if command -v lua-language-server &> /dev/null; then
        echo "[lua-language-server] Installed successfully"
    else
        echo "[lua-language-server] Installation may have succeeded but binary not in PATH"
        echo "                      Try restarting your terminal"
    fi
    exit 0
fi

# No brew available
echo "[lua-language-server] Not installed. Install via Homebrew:"
echo "                      brew install lua-language-server"
echo ""
echo "                      Or download from: https://github.com/LuaLS/lua-language-server/releases"

exit 0
