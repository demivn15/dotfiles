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

vim.lsp.enable({"lua-language-server", "pylsp", "clangd", "texlab", "quick-lint-js"})

vim.lsp.config("quick-lint-js", {
	cmd = { "/usr/bin/quick-lint-js", "--lsp-server" },
    filetypes = { "javascript" }
})
vim.lsp.config("clangd", {
    cmd = { "/usr/bin/clangd-19" }, 
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
vim.lsp.config("lua-language-server", {
})
vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = { "W391" },
          maxLineLength = 100,
        },
        mccabe = { enabled = false },
        pyflakes = { enabled = true },
        autopep8 = { enabled = false },
        black = { enabled = true },
      },
    },
  },
})

vim.diagnostic.config({ virtual_text = true })

-- Neovim Options

vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.cmd [[noswapfile]]
vim.cmd.colorscheme("carbonfox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
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

-- Netrw Config

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 3
vim.g.netrw_altfile = 1

-- Keymaps

-- Telescope
vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Netrw
vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<cr>", { silent = true })

-- Snippets
vim.keymap.set("n", "<space>lt", "<cmd>-1read ~/.config/nvim/snippets/latex-snippets/doc-template.tex<cr>9jvi")
