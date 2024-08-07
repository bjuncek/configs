vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.wo.number = true

vim.keymap.set('n', '<leader>tn', ':tabnew<cr>', {})
vim.keymap.set('n', '<leader>to', ':tabonly<cr>', {})
vim.keymap.set('n', '<leader>tc', ':tabclose<cr>', {})
vim.keymap.set('n', '<leader>tm', ':tabmove', {})
vim.keymap.set('n', '<leader>t<leader>', ':tabnext', {})



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
