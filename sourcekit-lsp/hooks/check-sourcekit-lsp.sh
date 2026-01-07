#!/bin/bash

# Check if sourcekit-lsp is available via xcrun (bundled with Xcode)

if xcrun --find sourcekit-lsp &> /dev/null; then
    # sourcekit-lsp is available, exit silently
    exit 0
fi

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &> /dev/null; then
    echo "[sourcekit-lsp] Xcode Command Line Tools not installed."
    echo "                Install Xcode from the App Store, or run:"
    echo "                xcode-select --install"
    exit 0
fi

# Xcode tools installed but sourcekit-lsp not found
echo "[sourcekit-lsp] sourcekit-lsp not found."
echo "                Install Xcode from the App Store or download a Swift toolchain from:"
echo "                https://swift.org/install/"

exit 0
