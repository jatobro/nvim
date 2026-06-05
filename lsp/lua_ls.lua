return {
	cmd = { "lua_language_server" },
	filetypes = { "lua" },
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
}
