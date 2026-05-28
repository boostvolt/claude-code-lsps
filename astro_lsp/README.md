# astro-lsp

Astro language server for Claude Code, providing code intelligence features for `.astro` files.

## Supported Extensions
`.astro`

## Installation

Install the Astro language server globally via npm:

```bash
npm install -g @astrojs/language-server
```

Or with yarn:

```bash
yarn global add @astrojs/language-server
```

## Usage

1. Install the plugin in Claude Code:
   ```
   /plugin install astro-lsp@claude-code-lsps
   ```

2. Open any `.astro` file in Claude Code

3. The Astro language server will automatically start and provide:
   - Diagnostics (errors, warnings)
   - Completions
   - Hover information
   - Go-to-definition
   - Find references

## More Information
- [@astrojs/language-server on npm](https://www.npmjs.com/package/@astrojs/language-server)
- [GitHub Repository](https://github.com/withastro/astro/tree/main/packages/language-tools/language-server)
