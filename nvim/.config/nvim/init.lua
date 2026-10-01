-- Packages

vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/sharkdp/fd" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range('3') },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    -- { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- LSP Config

--[[
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
]]

-- Neovim Options

require("vim._core.ui2").enable({})
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
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 250

--[[
vim.cmd [[set completeopt+=menuone,noselect,popup\]\]
 vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
 vim.opt.incsearch = true
 vim.opt.ignorecase = true
 vim.opt.smartcase = true
 vim.opt.signcolumn = "yes"
 vim.opt.mouse = ""
]]

-- Netrw Config

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_browse_split = 3
vim.g.netrw_altfile = 1

--[[
-- Terminal

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
]]

-- Keymaps

-- Telescope
vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree show toggle=true position=right dir=%:p:h<cr>")

-- Change working directory
vim.keymap.set("n", "<leader>c", "<cmd>:lcd %:p:h<cr>")

--[[
-- Terminal
local job_id = 0
vim.keymap.set("n", "<leader>T", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    job_id = vim.bo.channel
    vim.fn.chansend(job_id, {"clear\r\n"})
end)

-- Netrw
vim.keymap.set("n", "<leader>e", function()
    local current_dir = vim.fn.expand("%:p:h")
    if current_dir == "" then
        current_dir = vim.fn.getcwd()
    end
    vim.cmd("Lexplore! " .. vim.fn.fnameescape(current_dir))
end
)
]]
