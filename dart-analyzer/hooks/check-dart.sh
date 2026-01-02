#!/bin/bash

# Check if Dart SDK is installed and available in PATH

if command -v dart &> /dev/null; then
    DART_VERSION=$(dart --version 2>&1)
    exit 0
fi

# Check common Dart/Flutter installation paths
FLUTTER_DART="$FLUTTER_ROOT/bin/cache/dart-sdk/bin/dart"
if [ -n "$FLUTTER_ROOT" ] && [ -x "$FLUTTER_DART" ]; then
    echo "[dart-analyzer] Dart found via FLUTTER_ROOT: $FLUTTER_ROOT"
    echo "                Add to PATH: export PATH=\"\$PATH:\$FLUTTER_ROOT/bin/cache/dart-sdk/bin\""
    exit 0
fi

# Check for Flutter in common locations
for FLUTTER_PATH in "$HOME/flutter" "$HOME/.flutter" "/opt/flutter" "/usr/local/flutter"; do
    if [ -x "$FLUTTER_PATH/bin/cache/dart-sdk/bin/dart" ]; then
        echo "[dart-analyzer] Dart found at: $FLUTTER_PATH/bin/cache/dart-sdk/bin/dart"
        echo "                Add to PATH: export PATH=\"\$PATH:$FLUTTER_PATH/bin/cache/dart-sdk/bin\""
        exit 0
    fi
done

# Dart not found
echo "[dart-analyzer] Dart SDK not found in PATH."
echo ""
echo "Install options:"
echo "  1. Flutter (includes Dart): https://docs.flutter.dev/get-started/install"
echo "  2. Dart only: https://dart.dev/get-dart"
echo ""
echo "After installation, ensure 'dart' is in your PATH."

exit 0
