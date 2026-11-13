# CLAUDE.md

Personal Neovim 0.12 config. This repo is a git submodule of `~/.config` (`nvim/`); commit and push here, then bump the pointer in the outer repo.

## Architecture
- Plugins are managed with built-in `vim.pack` (`lua/jatobro/pack.lua`, lockfile `nvim-pack-lock.json`) — not lazy.nvim/packer. `:PackAdd user/repo` adds ad hoc.
- `init.lua` enables `vim._core.ui2` then requires one module per concern from `lua/jatobro/`. Order matters: options → pack → plugin setups → colorscheme.
- LSP: server configs in `lsp/<name>.lua` (e.g. `lua_ls.lua`); servers enabled in `lua/jatobro/lsp.lua` via `vim.lsp.enable`, installed with mason. LspAttach keymaps (`gr*`) use telescope pickers.
- Formatting: conform.nvim with format-on-save (`conform.lua`); lua uses stylua, JS/TS/CSS/HTML/JSON use prettierd.
- Colorscheme: `vague` with transparent backgrounds; keep consistent with `~/.config/ghostty/themes/vague`.

## Conventions
- Lua formatted with stylua: tabs, 130 columns (`.stylua.toml`).
- Add a plugin: append to `vim.pack.add`, create `lua/jatobro/<name>.lua`, add a `require` in `init.lua` (see the `nvim-add-plugin` skill).
- There is no build or test tooling; changes take effect on restart/reload.

## Keeping the README current

`README.md` documents the plugin table, layout, enabled LSP servers and treesitter parsers, required external formatters, and the keymap table. When a change adds, removes or alters any of these (e.g. a plugin in `pack.lua`, a server in `vim.lsp.enable`, a parser in `treesitter.lua`, a formatter in `conform.lua`, or a keymap), update `README.md` in the same change. If a change doesn't affect it, leave it alone.
