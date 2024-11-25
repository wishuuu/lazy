local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map({ "v", "n" }, "<leader>p", [["_dP]])

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>p", [["+p]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")

map("n", "<leader>w", vim.cmd.w)
map("n", "<leader>q", vim.cmd.q)
map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<C-f>", "<cmd>silent !tmux neww ses<CR>")

map({ "n", "v" }, "<C-i>", function()
  require("dial.map").manipulate("increment", "normal")
end)

map({ "n", "v" }, "g<C-i>", function()
  require("dial.map").manipulate("increment", "gnormal")
end)

map("v", "<leader>st", "gsa", { desc = "Surround with tag" })

vim.api.nvim_create_user_command("AddSurroundingTag", function()
  vim.cmd("normal vat")
  vim.schedule(function()
    vim.cmd("normal gsat")
  end)
end, { desc = "Adds surround HTML tag" })

vim.keymap.set("n", "<C-t>", ":AddSurroundingTag<CR>", { desc = "Add Surrounding HTML Tag" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
