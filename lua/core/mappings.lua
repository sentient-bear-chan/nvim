local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "x", '"_x', opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>l", ":bnext<CR>", opts)
map("n", "<leader>h", ":bprev<CR>", opts)
map("n", "<C-m>", ":nohlsearch<CR>", opts)
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fr", ":Telescope file_browser<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)
map("n", "<leader>fg", ":Telescope git_files<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Buffers
map("n", "<leader>bc", ":BufferClose<CR>", opts)
map("n", "<leader>bn", ":BufferNext<CR>", opts)
map("n", "<leader>bp", ":BufferPrevious<CR>", opts)
map("n", "<leader>ba", ":BufferCloseAllButCurrent<CR>", opts)

-- Terminal
map("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)
map("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)

-- Lsp
map("n", "<leader>lf", ":Lspsaga lsp_finder<CR>", opts)
map("n", "<leader>la", ":Lspsaga code_action<CR>", opts)
map("n", "<leader>lr", ":Lspsaga rename<CR>", opts)
map("n", "<leader>lr", ":Lspsaga rename ++project<CR>", opts)
map("n", "<leader>ld", ":Lspsaga peek_definition<CR>", opts)
map("n", "<leader>le", ":Lspsaga show_line_diagnostics<CR>", opts)
map("n", "<leader>lh", ":Lspsaga hover_doc<CR>", opts)

-- Git
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>gh", ":Git help<CR>", opts)
map("n", "<leader>ga", ":Git add<CR>", opts)
map("n", "<leader>gc", ":Git commit<CR>", opts)
map("n", "<leader>gb", ":Git branch<CR>", opts)
