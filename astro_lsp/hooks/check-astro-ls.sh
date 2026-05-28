#!/bin/bash

# Check if astro-ls is installed and available in PATH

if command -v astro-ls &> /dev/null; then
    exit 0
fi

# Check if npm is available
if ! command -v npm &> /dev/null; then
    echo "[astro-ls] npm is not installed. Please install Node.js first from https://nodejs.org/"
    echo "           Then run: npm install -g @astrojs/language-server"
    exit 0
fi

# npm is installed but astro-ls is not - install it
echo "[astro-ls] Installing @astrojs/language-server..."
npm install -g @astrojs/language-server

if command -v astro-ls &> /dev/null; then
    echo "[astro-ls] Installed successfully"
else
    echo "[astro-ls] Failed to install. Please run manually:"
    echo "           npm install -g @astrojs/language-server"
fi

exit 0
