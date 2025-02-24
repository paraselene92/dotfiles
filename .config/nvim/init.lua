require("kickstart")

vim.g.have_nerd_font = true

vim.keymap.set("n", "<S-a>", "^", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", ":Neotree<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-e>", ":NvimTreeOpen<CR>", { noremap = true, silent = true })
