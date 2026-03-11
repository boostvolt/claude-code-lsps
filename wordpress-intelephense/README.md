# wordpress-intelephense

PHP language server ([Intelephense](https://intelephense.com/)) for Claude Code with WordPress stubs enabled.

## Why?

The base `intelephense` plugin doesn't include WordPress stubs, so Intelephense reports false positives for WordPress core functions like `add_action`, `get_post`, `wp_nonce_field`, etc.

This plugin adds `"wordpress"` to Intelephense's built-in stubs list alongside all the default PHP stubs, giving you accurate diagnostics in WordPress projects.

## Usage

Install this plugin **instead of** the base `intelephense` plugin — not alongside it.

## Supported Extensions

`.php`, `.phtml`

## Installation

Install Intelephense globally via npm:

```bash
npm install -g intelephense
```

The plugin will attempt to install Intelephense automatically on first session start if it's not found.

## More Information

- [Intelephense Website](https://intelephense.com/)
- [Intelephense on npm](https://www.npmjs.com/package/intelephense)
