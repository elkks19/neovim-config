vim.diagnostic.config({
	virtual_lines = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- map("fd", vim.diagnostic.open_float, "Open diagnostics float")
		map("K", vim.lsp.buf.hover, "Hover documentation")
		map("gs", vim.lsp.buf.signature_help, "Signature help")
		map("gD", vim.lsp.buf.declaration, "Go to declaration")
		map("gi", vim.lsp.buf.implementation, "Go to implementation")
		map("<leader>aa", vim.lsp.buf.code_action, "Code action")
		map("<leader>rn", vim.lsp.buf.rename, "Rename all references")
		map("<leader>fo", vim.lsp.buf.format, "Format buffer")
		map("gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Go to definition in split")
	end,
})

