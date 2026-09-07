local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move highlighted blocks
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left" })
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right" })

keymap("n", "<leader>ss", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save buffer" })
keymap("n", "<leader>bl", "<C-^>", { noremap = true, silent = true, desc = "Toggle last buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { noremap = true, silent = true, desc = "Close buffer" })

keymap("n", "<leader>tf", "za", { desc = "Toggle fold" })
keymap("n", "<leader>to", "zR", { desc = "Open all folds" })
keymap("n", "<leader>tF", "zM", { desc = "Close all folds" })