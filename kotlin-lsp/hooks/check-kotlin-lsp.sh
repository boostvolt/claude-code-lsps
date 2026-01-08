#!/bin/bash

# Check if kotlin-lsp is installed and available in PATH

if command -v kotlin-lsp &> /dev/null; then
    exit 0
fi

# Check if Java is available and version is 17+
if ! command -v java &> /dev/null; then
    echo "[kotlin-lsp] Java is not installed. Kotlin LSP requires Java 17 or above."
    echo "          Install Java: brew install openjdk@17"
    exit 0
fi

# Check Java version
java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)
if [ "$java_version" -lt 17 ] 2>/dev/null; then
    echo "[kotlin-lsp] Java version $java_version found. Kotlin LSP requires Java 17 or above."
    echo "          Install Java 17+: brew install openjdk@17"
    exit 0
fi

# Check if brew is available (macOS)
if command -v brew &> /dev/null; then
    echo "[kotlin-lsp] Installing kotlin-lsp via Homebrew..."
    brew install JetBrains/utils/kotlin-lsp

    if command -v kotlin-lsp &> /dev/null; then
        echo "[kotlin-lsp] Installed successfully"
        exit 0
    fi
fi

# Manual instructions
echo "[kotlin-lsp] kotlin-lsp is not installed."
echo "          Install: brew install JetBrains/utils/kotlin-lsp"
echo "          Or download from: https://github.com/Kotlin/kotlin-lsp/releases"
echo "          Requires Java 17+"

exit 0
