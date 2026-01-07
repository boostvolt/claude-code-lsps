#!/bin/bash

# Check if clojure-lsp is installed and available in PATH

if command -v clojure-lsp &> /dev/null; then
    exit 0
fi

# Try brew
if command -v brew &> /dev/null; then
    echo "[clojure-lsp] Installing via Homebrew..."
    brew install clojure-lsp

    if command -v clojure-lsp &> /dev/null; then
        echo "[clojure-lsp] Installed successfully"
    else
        echo "[clojure-lsp] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[clojure-lsp] Not installed. Install via:"
echo "              brew install clojure-lsp"
echo ""
echo "              Or see: https://clojure-lsp.io/installation/"

exit 0
