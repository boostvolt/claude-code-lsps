# Claude Code LSPs

A collection of Language Server Protocol (LSP) plugins for [Claude Code](https://github.com/anthropics/claude-code).

![LSP Demo](assets/lsp-demo.png)

## What is LSP Integration?

The Language Server Protocol provides IDE-like intelligence to Claude Code. On startup, Claude Code automatically starts LSP servers from installed plugins and exposes them to Claude in two ways:

**LSP Tool** - A builtin tool with 5 operations mapping directly to LSP commands:

- `goToDefinition` - Jump to where a symbol is defined
- `findReferences` - Find all usages of a symbol
- `hover` - Get documentation and type info
- `documentSymbol` - List all symbols in a file
- `workspaceSymbol` - Search symbols across the project

**Automatic Diagnostics** - Real-time error and warning detection similar to the VS Code integration, but operating independently. These diagnostics tend to be faster and more comprehensive than the VS Code equivalent.

## Available Plugins

| Plugin                                             | Language              | LSP                                                                      |
| -------------------------------------------------- | --------------------- | ------------------------------------------------------------------------ |
| [gopls](./gopls)                                   | Go                    | [gopls](https://github.com/golang/tools/tree/master/gopls)               |
| [vtsls](./vtsls)                                   | TypeScript/JavaScript | [vtsls](https://github.com/yioneko/vtsls)                                |
| [pyright](./pyright)                               | Python                | [pyright](https://github.com/microsoft/pyright)                          |
| [jdtls](./jdtls)                                   | Java                  | [jdtls](https://github.com/eclipse-jdtls/eclipse.jdt.ls)                 |
| [clangd](./clangd)                                 | C/C++                 | [clangd](https://clangd.llvm.org/)                                       |
| [omnisharp](./omnisharp)                           | C#                    | [OmniSharp](https://github.com/OmniSharp/omnisharp-roslyn)               |
| [intelephense](./intelephense)                     | PHP                   | [Intelephense](https://github.com/bmewburn/intelephense-docs)            |
| [kotlin-language-server](./kotlin-language-server) | Kotlin                | [kotlin-language-server](https://github.com/fwcd/kotlin-language-server) |
| [rust-analyzer](./rust-analyzer)                   | Rust                  | [rust-analyzer](https://github.com/rust-lang/rust-analyzer)              |
| [solargraph](./solargraph)                         | Ruby                  | [Solargraph](https://github.com/castwide/solargraph)                     |
| [vscode-html-css](./vscode-html-css)               | HTML/CSS              | [vscode-langservers](https://github.com/hrsh7th/vscode-langservers-extracted) |
| [dart-analyzer](./dart-analyzer)                   | Dart/Flutter          | [Dart SDK](https://dart.dev/tools/dart-analyze)                          |

## Getting Started

### 1. Enable the LSP Tool

The LSP tool is not yet enabled by default. Add to your shell profile (`.bashrc`, `.zshrc`, etc.):

```bash
export ENABLE_LSP_TOOL=1
```

Or run with the environment variable:

```bash
ENABLE_LSP_TOOL=1 claude
```

### 2. Add the Marketplace

```bash
claude
/plugin marketplace add boostvolt/claude-code-lsps
```

### 3. Install Plugins

Install individual plugins:

```bash
/plugin install gopls@claude-code-lsps
/plugin install vtsls@claude-code-lsps
/plugin install pyright@claude-code-lsps
/plugin install jdtls@claude-code-lsps
/plugin install clangd@claude-code-lsps
/plugin install omnisharp@claude-code-lsps
/plugin install intelephense@claude-code-lsps
/plugin install kotlin-language-server@claude-code-lsps
/plugin install rust-analyzer@claude-code-lsps
/plugin install solargraph@claude-code-lsps
/plugin install vscode-html-css@claude-code-lsps
/plugin install dart-analyzer@claude-code-lsps
```

Or browse and install interactively:

```bash
/plugin
```

---

## Manual LSP Installation

Each plugin will attempt to auto-install its LSP server on first use. If auto-install fails, use the manual instructions below.

<details>
<summary><strong>Go (gopls)</strong></summary>

```bash
go install golang.org/x/tools/gopls@latest
```

Ensure `~/go/bin` is in your PATH.

</details>

<details>
<summary><strong>TypeScript/JavaScript (vtsls)</strong></summary>

```bash
npm install -g @vtsls/language-server typescript
```

</details>

<details>
<summary><strong>Python (pyright)</strong></summary>

```bash
pip install pyright
```

</details>

<details>
<summary><strong>Java (jdtls)</strong></summary>

```bash
brew install jdtls
```

Or download manually from [Eclipse JDT Language Server](http://download.eclipse.org/jdtls/snapshots/).

Requires Java 21+ runtime.

</details>

<details>
<summary><strong>C/C++ (clangd)</strong></summary>

```bash
brew install llvm
```

Or via Xcode Command Line Tools:

```bash
xcode-select --install
```

</details>

<details>
<summary><strong>C# (omnisharp)</strong></summary>

```bash
brew install omnisharp/omnisharp-roslyn/omnisharp-mono
```

Or via dotnet:

```bash
dotnet tool install -g csharp-ls
```

</details>

<details>
<summary><strong>PHP (intelephense)</strong></summary>

```bash
npm install -g intelephense
```

</details>

<details>
<summary><strong>Kotlin (kotlin-language-server)</strong></summary>

```bash
brew install kotlin-language-server
```

</details>

<details>
<summary><strong>Rust (rust-analyzer)</strong></summary>

```bash
brew install rust-analyzer
```

Or via rustup:

```bash
rustup component add rust-analyzer
```

</details>

<details>
<summary><strong>Ruby (solargraph)</strong></summary>

```bash
gem install solargraph
```

</details>

<details>
<summary><strong>HTML/CSS (vscode-html-css)</strong></summary>

```bash
npm install -g vscode-langservers-extracted
```

</details>

<details>
<summary><strong>Dart/Flutter (dart-analyzer)</strong></summary>

Install Dart SDK:

```bash
brew tap dart-lang/dart
brew install dart
```

Or install Flutter (includes Dart):

```bash
# See https://docs.flutter.dev/get-started/install
```

Ensure `dart` is in your PATH.

</details>

---

## Creating Your Own Plugin

<details>
<summary><strong>Plugin Structure</strong></summary>

```
my-lsp/
├── .claude-plugin/
│   └── plugin.json
├── .lsp.json
└── hooks/
    ├── hooks.json
    └── check-my-lsp.sh
```

</details>

<details>
<summary><strong>.lsp.json Schema</strong></summary>

The `.lsp.json` file configures the language server:

```json
{
  "language-id": {
    "command": "lsp-server-command",
    "args": ["--stdio"],
    "extensionToLanguage": {
      ".ext": "language-id"
    },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

| Field                   | Type     | Required | Description                                             |
| ----------------------- | -------- | -------- | ------------------------------------------------------- |
| `command`               | string   | Yes      | Command to start the LSP server                         |
| `args`                  | string[] | No       | Arguments passed to the command                         |
| `extensionToLanguage`   | object   | Yes      | Maps file extensions to language IDs                    |
| `transport`             | string   | No       | Communication method: `"stdio"` (default) or `"socket"` |
| `initializationOptions` | object   | No       | Options passed during LSP initialization                |
| `settings`              | object   | No       | Server-specific settings                                |
| `maxRestarts`           | number   | No       | Max restart attempts on crash (default: 3)              |

</details>

<details>
<summary><strong>Example: gopls</strong></summary>

`.lsp.json`:

```json
{
  "go": {
    "command": "gopls",
    "args": [],
    "extensionToLanguage": {
      ".go": "go"
    },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

`.claude-plugin/plugin.json`:

```json
{
  "name": "gopls",
  "description": "Go language server",
  "version": "1.0.0",
  "author": {
    "name": "Your Name"
  }
}
```

`hooks/hooks.json` (optional auto-install):

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PLUGIN_ROOT}/hooks/check-gopls.sh",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

</details>

## License

MIT
