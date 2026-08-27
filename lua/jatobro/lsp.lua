require("mason").setup()

vim.lsp.enable({ "lua_ls", "rust_analyzer", "ruff", "pyright", "tailwindcss", "ts_ls", "terraformls", "gopls" })

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	virtual_text = true,
	virtual_lines = false,
	jump = { float = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(args)
		local buf = args.buf
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local client = vim.lsp.get_client_by_id(client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client_id, buf, {
				autotrigger = true,
			})
		end

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = buf, desc = "LSP: Rename" })
		vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { buffer = buf, desc = "LSP: Code Action" })
		vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = buf, desc = "LSP: Go to Declaration" })
		vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "LSP: Go to Definition" })
		vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "LSP: Go to References" })
		vim.keymap.set("n", "gri", builtin.lsp_implementations, { buffer = buf, desc = "LSP: Go to Implementation" })
		vim.keymap.set("n", "grt", builtin.lsp_type_definitions, { buffer = buf, desc = "LSP: Go to Type Definition" })
		vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "LSP: Document Symbols" })
		vim.keymap.set("n", "gW", builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = "LSP: Workspace Symbols" })

		if client and client:supports_method("textDocument/inlayHint", buf) then
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
			end, { buffer = buf, desc = "Toggle Inlay Hints" })
		end

		if client and client:supports_method("textDocument/documentHighlight", buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(args2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = args2.buf })
				end,
			})
		end
	end,
})
