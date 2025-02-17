vim.g.have_nerd_font = true

vim.keymap.set("n", "<C-e>", ":NvimTreeOpen<CR>", { noremap = true, silent = true })

require("kickstart")
require("custom.plugins")
