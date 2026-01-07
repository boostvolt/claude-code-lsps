# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a collection of LSP (Language Server Protocol) plugins for Claude Code. Each plugin enables language intelligence features (go-to-definition, find-references, hover, diagnostics) for a specific programming language.

## Repository Structure

Each plugin is a self-contained directory with this structure:

```
<plugin-name>/
├── .claude-plugin/
│   └── plugin.json      # Plugin metadata + refs to hooks/lspServers
├── .lsp.json            # LSP server configuration
└── hooks/
    ├── hooks.json       # Hook definitions (runs on SessionStart)
    └── check-<name>.sh  # Auto-install script for the LSP binary
```

## Key Files

### `.lsp.json`
Configures the language server. Only required fields:
- `command`: The LSP binary to execute
- `extensionToLanguage`: Maps file extensions to language IDs

Optional: `args`, `loggingConfig` (for debug logging support)

### `hooks/check-*.sh`
Auto-install scripts that run on session start. Pattern:
1. Check if LSP binary exists → exit silently if yes
2. Check if language runtime exists → show install instructions if no
3. Attempt auto-install → show PATH instructions if needed

## Adding a New Plugin

1. Create a new directory with the plugin name
2. Add `.claude-plugin/plugin.json` with name, description, version, author, and refs:
   - `"hooks": "./hooks/hooks.json"`
   - `"lspServers": "./.lsp.json"`
3. Add `.lsp.json` with command and extensionToLanguage mapping
4. Add `hooks/hooks.json` to run auto-install on SessionStart
5. Add `hooks/check-<name>.sh` auto-install script
6. Update README.md: add to Available Plugins table and Manual Installation section

## Debug Logging

Plugins that support args/env-based logging should include `loggingConfig`:
- Args-based: `"loggingConfig": { "args": ["--verbose"] }`
- Env-based: `"loggingConfig": { "env": { "DEBUG": "true" } }`

Use `${CLAUDE_PLUGIN_LSP_LOG_FILE}` for log file paths.

## References

- [Official LSP docs](https://code.claude.com/docs/en/plugins-reference#lsp-servers)
- Requires Claude Code 2.0.74+
