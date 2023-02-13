local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local map = vim.keymap.set

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gf", ":Lspsaga lsp_finder<CR>", opts)
	map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", ":Lspsaga peek_definition<CR>", opts)
	map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
	map("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
	map("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>", opts)
	map("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts)
	map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
	map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)
	map("n", "K", ":Lspsaga hover_doc<CR>", opts)
	map("n", "<leader>o", ":LSoutlineToggle<CR>", opts)
	map({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
