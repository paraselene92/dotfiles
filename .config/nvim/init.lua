require("kickstart")

vim.g.have_nerd_font = true

vim.keymap.set("n", "<S-a>", "^", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", ":Neotree<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "GitSigns [h]unk [d]iff" })

vim.keymap.set("n", "<leader>hi", function()
	require("gitsigns").preview_hunk_inline()
end, { desc = "GitSigns [h]unk preview [i]nline" })

vim.keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "GitSigns [h]unk [r]eset" })

vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").stage_buffer()
end, { desc = "GitSigns [h]unk [b]uffer" })

vim.keymap.set("n", "<leader>ll", function()
	require("lazygit").lazygit()
end, { desc = "[l]azygit " })
