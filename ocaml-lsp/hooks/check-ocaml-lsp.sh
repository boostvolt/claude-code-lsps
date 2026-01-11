#!/bin/bash

# Check if opam is installed first
if ! command -v opam &> /dev/null; then
    echo "[ocaml-lsp] Not installed. Install opam first, then install ocaml-lsp-server:"
    echo "            brew install opam"
    echo "            opam init"
    echo "            opam install ocaml-lsp-server"
    echo ""
    echo "            See: https://ocaml.org/docs/installing-ocaml"
    exit 0
fi

# Check if ocamllsp is available via opam exec
if opam exec -- which ocamllsp &> /dev/null; then
    exit 0
fi

# Try to install ocaml-lsp-server via opam
echo "[ocaml-lsp] Installing via opam..."
opam install -y ocaml-lsp-server

if opam exec -- which ocamllsp &> /dev/null; then
    echo "[ocaml-lsp] Installed successfully"
else
    echo "[ocaml-lsp] Installation completed but ocamllsp not found."
    echo "            You may need to initialize an opam switch first:"
    echo "            opam switch create default ocaml-base-compiler"
fi

exit 0
