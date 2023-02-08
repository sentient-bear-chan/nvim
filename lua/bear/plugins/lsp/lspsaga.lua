local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	finder_action_keys = { open = "<CR>" },
	definition_action_keys = { edit = "<CR>" },
	ui = {
		-- Currently, only the round theme exists
		theme = "round",
		-- This option only works in Neovim 0.9
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "",
		diagnostic = "",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
	},
})
