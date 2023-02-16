local null = require('null-ls')

local formatting = null.builtins.formatting
local sources    = { formatting.stylua }

null.setup({
  sources = sources,
  formatting = formatting,
})


require("mason-null-ls").setup({
    ensure_installed = { "stylua" }
})
