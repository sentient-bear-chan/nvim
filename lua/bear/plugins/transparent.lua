local status, transparent = pcall(require, "transparent")
if not status then
	return
end

transparent.setup({
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
		"NvimTree_1",
	},
	exclude = {}, -- table: groups you don't want to clear
})
