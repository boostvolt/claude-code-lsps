#!/bin/bash

# Check if zls is installed and available in PATH

if command -v zls &> /dev/null; then
    exit 0
fi

# Check if zig is installed (required for zls to be useful)
if ! command -v zig &> /dev/null; then
    echo "[zls] Zig is not installed. Please install Zig first from https://ziglang.org/download/"
    exit 0
fi

# Try brew
if command -v brew &> /dev/null; then
    echo "[zls] Installing via Homebrew..."
    brew install zls

    if command -v zls &> /dev/null; then
        echo "[zls] Installed successfully"
    else
        echo "[zls] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[zls] Not installed. Install via:"
echo "      brew install zls"
echo ""
echo "      Or download from: https://github.com/zigtools/zls/releases"

exit 0
