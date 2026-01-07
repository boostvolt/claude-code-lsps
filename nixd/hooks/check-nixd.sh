#!/bin/bash

# Check if nixd is installed and available in PATH

if command -v nixd &> /dev/null; then
    exit 0
fi

# Check if nix is installed
if command -v nix &> /dev/null; then
    echo "[nixd] Installing via nix..."
    nix profile install nixpkgs#nixd

    if command -v nixd &> /dev/null; then
        echo "[nixd] Installed successfully"
    else
        echo "[nixd] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[nixd] Not installed. Install Nix first, then install nixd:"
echo "       sh <(curl -L https://nixos.org/nix/install)"
echo "       nix profile install nixpkgs#nixd"
echo ""
echo "       See: https://github.com/nix-community/nixd"

exit 0
