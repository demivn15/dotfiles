-- Packages

vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/sharkdp/fd" },
})

-- LSP Config

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

-- Neovim Options

vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.cmd [[noswapfile]]
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

-- Keymaps

-- Telescope
vim.keymap.set("n", "<space>t", "<cmd>Telescope<cr>")
vim.keymap.set("n", "<space>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<space>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<space>fg", "<cmd>Telescope live_grep<cr>")

-- Snippets
vim.keymap.set("n", "<space>cm", "<cmd>-1read ~/.config/nvim/snippets/c-snippets/c-main.c<cr>o")
vim.keymap.set("n", "<space>lt", "<cmd>-1read ~/.config/nvim/snippets/latex-snippets/doc-template.tex<cr>9jvi")
