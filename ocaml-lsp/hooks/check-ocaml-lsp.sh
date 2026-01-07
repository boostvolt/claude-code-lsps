#!/bin/bash

# Check if ocamllsp is installed and available in PATH

if command -v ocamllsp &> /dev/null; then
    exit 0
fi

# Check if opam is installed
if command -v opam &> /dev/null; then
    echo "[ocaml-lsp] Installing via opam..."
    opam install -y ocaml-lsp-server

    if command -v ocamllsp &> /dev/null; then
        echo "[ocaml-lsp] Installed successfully"
    else
        echo "[ocaml-lsp] Installed. Run 'eval \$(opam env)' to update PATH"
    fi
    exit 0
fi

echo "[ocaml-lsp] Not installed. Install opam first, then install ocaml-lsp-server:"
echo "            brew install opam"
echo "            opam init"
echo "            opam install ocaml-lsp-server"
echo ""
echo "            See: https://ocaml.org/docs/installing-ocaml"

exit 0
