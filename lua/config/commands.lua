-- ── Helpers ──────────────────────────────────────────────────────────

-- Target clients: by name(s) passed as args, or the ones from the current buffer
local function get_target_clients(fargs)
	if fargs and #fargs > 0 then
		local clients = {}
		for _, name in ipairs(fargs) do
			vim.list_extend(clients, vim.lsp.get_clients({ name = name }))
		end
		return clients
	end
	return vim.lsp.get_clients({ bufnr = 0 })
end

-- Autocomplete with names of active clients
local function complete_client_names(arglead)
	local seen, names = {}, {}
	for _, client in ipairs(vim.lsp.get_clients()) do
		if not seen[client.name] and vim.startswith(client.name, arglead) then
			seen[client.name] = true
			table.insert(names, client.name)
		end
	end
	return names
end




-- :LspList to list all LSP clients attached to the current buffer
vim.api.nvim_create_user_command("LspList", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if vim.tbl_isempty(clients) then
		vim.notify("No LSP clients attached to this buffer", vim.log.levels.WARN)
		return
	end
	local lines = {}
	for _, c in ipairs(clients) do
		table.insert(lines, string.format("[%d] %s", c.id, c.name))
		table.insert(lines, string.format("    root: %s", c.root_dir or "(no root_dir)"))
		table.insert(lines,
			string.format("    cmd:  %s",
				type(c.config.cmd) == "table" and table.concat(c.config.cmd, " ") or "(function)"))
	end
	vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end, { desc = "List LSP clients attached to the current buffer" })


-- :LspInfo to show LSP info (checkhealth vim.lsp)
vim.api.nvim_create_user_command("LspInfo", function()
	vim.cmd("checkhealth vim.lsp")
end, { desc = "LSP info (checkhealth vim.lsp)" })

-- :LspLog to open the LSP log in a new tab
vim.api.nvim_create_user_command("LspLog", function()
	vim.cmd("tabnew " .. vim.fn.fnameescape(vim.lsp.log.get_filename()))
end, { desc = "Open the LSP log" })

-- :LspStart to re-trigger LSP autostart for the current buffer
vim.api.nvim_create_user_command("LspStart", function()
	vim.api.nvim_exec_autocmds("FileType", { buffer = 0 })
	vim.notify("LSP autostart re-triggered for this buffer")
end, { desc = "Start LSP on the current buffer" })

-- :LspRestart to restart LSP clients attached to the current buffer
vim.api.nvim_create_user_command("LspRestart", function(opts)
	local clients = get_target_clients(opts.fargs)
	if vim.tbl_isempty(clients) then
		vim.notify("No clients found to restart", vim.log.levels.WARN)
		return
	end

	local saved = {}
	for _, client in ipairs(clients) do
		table.insert(saved, {
			name = client.name,
			config = client.config,
			bufs = vim.lsp.get_client_by_id(client.id).attached_buffers,
		})
		client:stop(opts.bang)
	end

	vim.defer_fn(function()
		for _, item in ipairs(saved) do
			for _, buf in ipairs(item.bufs) do
				if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
					-- vim.lsp.start reuses the client if one already exists with the same config
					vim.lsp.start(item.config, { bufnr = buf })
				end
			end
			vim.notify("Restarted: " .. item.name)
		end
	end, 500)
end, {
	nargs = "*",
	bang = true,
	complete = complete_client_names,
	desc = "Restart LSP clients",
})


