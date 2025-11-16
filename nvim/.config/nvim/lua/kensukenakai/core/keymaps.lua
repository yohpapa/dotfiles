-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>no", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Move the focus to the below window" })
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Move the focus to the above window" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Move the focus to the left window" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Move the focus to the right window" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- terminal mode
keymap.set("t", "<leader>sh", "<C-\\><C-n><C-w>h", { desc = "Go to left window (terminal)" })
keymap.set("t", "<leader>sj", "<C-\\><C-n><C-w>j", { desc = "Go to lower window (terminal)" })
keymap.set("t", "<leader>sk", "<C-\\><C-n><C-w>k", { desc = "Go to upper window (terminal)" })
keymap.set("t", "<leader>sl", "<C-\\><C-n><C-w>l", { desc = "Go to right window (terminal)" })
keymap.set("t", "<leader>sx", "<C-\\><C-n>", { desc = "Exit terminal mode" })
