#!/bin/bash

# Check if elixir-ls is installed and available in PATH

if command -v elixir-ls &> /dev/null; then
    exit 0
fi

# Check if elixir is installed (required for elixir-ls to be useful)
if ! command -v elixir &> /dev/null; then
    echo "[elixir-ls] Elixir is not installed. Please install Elixir first:"
    echo "            brew install elixir"
    echo "            Or see: https://elixir-lang.org/install.html"
    exit 0
fi

# Try brew
if command -v brew &> /dev/null; then
    echo "[elixir-ls] Installing via Homebrew..."
    brew install elixir-ls

    if command -v elixir-ls &> /dev/null; then
        echo "[elixir-ls] Installed successfully"
    else
        echo "[elixir-ls] Installation may have succeeded but binary not in PATH"
    fi
    exit 0
fi

echo "[elixir-ls] Not installed. Install via:"
echo "            brew install elixir-ls"
echo ""
echo "            Or see: https://github.com/elixir-lsp/elixir-ls"

exit 0
