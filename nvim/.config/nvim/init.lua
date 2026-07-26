vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable({"lua-language-server", "python-lsp-server", "clangd", "texlab"})

vim.lsp.config("clangd", {
    cmd = { "/usr/bin/clangd-19" }, 
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
vim.lsp.config("lua-language-server", {
    filetypes = { "python" },
})
vim.lsp.config("python-lsp-server", {
    filetypes = { "lua" },
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]

vim.cmd.colorscheme("carbonfox")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.mouse = ""

vim.keymap.set("n", ",c-main", "<cmd>-1read ~/.config/nvim/snippets/c-snippets/c-main.c<cr>o")
vim.keymap.set("n", ",doc-template", "<cmd>-1read ~/.config/nvim/snippets/latex-snippets/doc-template.tex<cr>9jvi")
