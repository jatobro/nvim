# Neovim 0.12 configuration

Personal Neovim config, tracked as a submodule of [jatobro/dotfiles](https://github.com/jatobro/dotfiles) (`~/.config/nvim`).

Requires **Neovim 0.12**. Plugins are managed with the built-in `vim.pack` (no lazy.nvim/packer); versions are pinned in `nvim-pack-lock.json`.

## Plugins

| Area | Plugin |
| --- | --- |
| Colorscheme | [vague.nvim](https://github.com/vague-theme/vague.nvim) (transparent) |
| Fuzzy finding | telescope.nvim (+ ui-select), plenary, nvim-web-devicons |
| LSP | nvim-lspconfig, mason.nvim |
| Completion | blink.cmp |
| Formatting | conform.nvim (format on save) |
| Syntax | nvim-treesitter (`main` branch) |
| Editing | mini.ai, mini.surround, mini.statusline |
| UI / git | which-key.nvim, gitsigns.nvim, todo-comments.nvim |

## Layout

- `init.lua` — loads one module per concern from `lua/jatobro/`. Order matters: options → pack → plugin setups → colorscheme.
- `lua/jatobro/pack.lua` — the `vim.pack.add` plugin list and a `:PackAdd user/repo` command.
- `lsp/` — per-server LSP configs (e.g. `lua_ls.lua`); servers are enabled in `lua/jatobro/lsp.lua`.

## Language support

LSP servers enabled: `lua_ls`, `rust_analyzer`, `ruff`, `pyright`, `tailwindcss`, `ts_ls`, `terraformls`, `gopls`, `buf_ls` (install via `:Mason`).

Treesitter parsers installed automatically: lua, javascript, typescript, tsx, html, css, json, markdown, bash, python, rust, go.

## Formatting

conform.nvim formats on save (disabled for C/C++), falling back to LSP formatting. External formatters must be on `PATH`:

- `stylua` for Lua (tabs, 130 columns — see `.stylua.toml`)
- `prettierd` for JS/TS/JSX/TSX, CSS, HTML, JSON

## Keymaps

Leader is `<Space>`. Run `<leader>` and wait for which-key to list the rest.

| Keys | Action |
| --- | --- |
| `<leader>w` / `<leader>q` | Save / quit |
| `<leader>e` | Open file explorer (netrw) |
| `<leader>ff` / `fg` / `fb` / `fh` | Telescope: files / live grep / buffers / help |
| `<leader>dd` | Workspace diagnostics |
| `<leader>lf` | Format buffer |
| `<leader>re` | Restart Neovim |
| `<C-h/j/k/l>` | Move between windows |
| `gl` | Show diagnostic float |
| `grn` `gra` `grd` `grr` `gri` `grt` | LSP: rename, code action, definition, references, implementation, type definition |
| `gO` / `gW` | Document / workspace symbols |
| `<leader>th` | Toggle inlay hints |

## Adding a plugin

Append to the `vim.pack.add` list in `lua/jatobro/pack.lua`, create `lua/jatobro/<plugin>.lua` with its setup, and `require` it in `init.lua`.
