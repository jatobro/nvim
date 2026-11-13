---
name: nvim-add-plugin
description: Add a new plugin to this Neovim 0.12 config using built-in vim.pack. Use when asked to install or configure a plugin.
---

Plugins use `vim.pack` (not lazy.nvim/packer).

1. Append the repo URL (or `{ src = ..., version = ... }`) to the `vim.pack.add` list in `lua/jatobro/pack.lua`.
2. Create `lua/jatobro/<plugin>.lua` with its setup/keymaps (tabs, 130 cols; see `.stylua.toml`).
3. Add `require("jatobro.<plugin>")` in `init.lua`. Order matters: options → pack → plugin setups → colorscheme. Put it after `pack` and before `colorscheme` unless it must load later.
4. Run Neovim once so `vim.pack` installs it and updates `nvim-pack-lock.json`; commit the lockfile with the change.
5. For docs/options of the plugin, use Context7.

LSP servers: add `lsp/<name>.lua` (returns `cmd`, `filetypes`, `settings`) and add the name to `vim.lsp.enable({...})` in `lua/jatobro/lsp.lua`. Formatters: `formatters_by_ft` in `conform.lua`.
