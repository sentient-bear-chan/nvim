local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
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

	if client.name == "tsserver" then
		map("n", "<leader>rf", ":TypescriptRenameFile<CR>")
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = { hostInfo = "neovim" },
	single_file_support = true,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["sumneko_lua"].setup({
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

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["marksman"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
