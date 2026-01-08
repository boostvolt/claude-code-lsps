---
name: Bug Report
about: Report an issue with an LSP plugin
title: '[PLUGIN_NAME] Brief description of the issue'
labels: bug
assignees: ''
---

## Plugin Information
**Plugin name:** (e.g., gopls, pyright, rust-analyzer)
**Plugin version:** (from `/plugin` in Claude Code)

## Environment
**Claude Code version:** (run `claude --version` or check in UI)
**Operating System:** (macOS, Linux, Windows)
**LSP server version:** (e.g., `gopls version`, `pyright --version`)

## Checklist
Please confirm you have completed the following before submitting:

- [ ] I am using Claude Code v2.1.0 or later (LSP is broken in v2.0.69-v2.0.x)
- [ ] I checked the **Plugins tab** in Claude Code (`/plugin`) for errors
- [ ] I verified the LSP server is installed according to [Manual Installation](https://github.com/boostvolt/claude-code-lsps#manual-lsp-installation) instructions
- [ ] I verified the LSP binary is in my PATH (e.g., `which gopls`, `which pyright`)
- [ ] I checked Claude Code logs at `~/.claude/debug/` (if `--enable-lsp-logging` was used)

## Description
A clear description of what the issue is.

## Steps to Reproduce
1. Open a file with extension `.ext`
2. Try to use LSP feature (e.g., go to definition)
3. See error

## Expected Behavior
What you expected to happen.

## Actual Behavior
What actually happened.

## Error Messages
```
Paste any error messages from:
- Claude Code UI
- Plugins tab in Claude Code (/plugin)
- Claude Code logs (~/.claude/debug/)
```

## Additional Context
Add any other context, screenshots, or configuration details.
