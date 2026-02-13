-- ~/.config/nvim/init.lua
-- single-file Neovim configuration
------------------------------------------------------------
--                                                             --
--   0.  helpers                                               --
--                                                             --
------------------------------------------------------------
local g, opt, map = vim.g, vim.opt, vim.keymap.set

local function nmap(lhs, rhs, opts) map("n", lhs, rhs, opts or {}) end
local function vmap(lhs, rhs, opts) map("v", lhs, rhs, opts or {}) end
----------------------------------------------------------------
--                                                             --
--   1.  basic options                                         --
--                                                             --
----------------------------------------------------------------
g.mapleader = " "                          -- SPACE as <leader>
g.loaded_netrw, g.loaded_netrwPlugin = 1, 1 -- nvim-tree prefers netrw disabled

opt.clipboard:append("unnamedplus")
opt.modelines = 0
opt.expandtab = true
opt.tabstop, opt.shiftwidth, opt.softtabstop = 4, 4, 4
opt.scrolloff   = 20
opt.autoindent  = true
opt.visualbell  = true
-- opt.t_vb        = ""
opt.encoding    = "utf-8"
opt.showmode    = true
opt.showcmd     = true
opt.hidden      = true
opt.wildmenu    = true
opt.wildmode    = "list:longest"
opt.wildignore  = {
  "*.pkl","*.swp","*.bak","*.pyc","*.class","*.o","*.obj",".DS_Store","*.jpg","*.d","*.dia",
  "*.imageset","*.png","*.ai","*/Pods/*","*.xcworkspace","*.xcodeproj","*/tmp/*","*.lock",
  "*/xcodebuild/*","*.orig","*.rope*","*/node_modules/*"
}
opt.ruler       = true
opt.backspace   = { "indent", "eol", "start" }
opt.undofile    = true
opt.textwidth   = 0
opt.formatoptions:remove({ "t", "c" })
opt.autoread    = true

-- history / persistence
opt.backup, opt.writebackup, opt.swapfile = true, true, true
opt.backupdir  = vim.fn.stdpath("config") .. "/backup//"
opt.directory  = vim.fn.stdpath("config") .. "/swap//"
opt.undodir    = vim.fn.stdpath("config") .. "/undo//"
opt.history    = 500
opt.undolevels = 500
opt.incsearch  = true

-- search
opt.ignorecase = true
opt.smartcase  = true
opt.gdefault   = true
opt.hlsearch   = true

-- misc
opt.shortmess:append("A")      -- no swap warnings
opt.signcolumn = "yes"

----------------------------------------------------------------
--                                                             --
--   2.  autocommands                                          --
--                                                             --
----------------------------------------------------------------
-- auto-write on focus loss
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wa" })

-- go files use hard tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.expandtab  = false
    vim.bo.tabstop    = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})

-- keep textwidth = 0 for Vimscript buffers
vim.api.nvim_create_autocmd({"FileType","BufEnter"}, {
  pattern = "vim",
  callback = function() vim.bo.textwidth = 0 end,
})

-- choose 'e' when swap file already exists
vim.api.nvim_create_autocmd("SwapExists", {
  callback = function() vim.v.swapchoice = 'e' end,
})

-- put current file name in terminal title
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local name = vim.fn.expand("%:t")
    if #name > 0 then
      opt.title = true
      opt.titlestring = name
    end
  end,
})

-- 2 spaces indentation in markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- make sure we’re still using spaces, not real tabs
    vim.bo.expandtab    = true
    -- and set the indent width to 2
    vim.bo.tabstop      = 2
    vim.bo.shiftwidth   = 2
    vim.bo.softtabstop  = 2
  end,
})

----------------------------------------------------------------
--                                                             --
--   3.  keymaps                                               --
--                                                             --
----------------------------------------------------------------
-- file explorer
nmap("<leader>f", ":NvimTreeToggle<CR>", { silent = true })

-- edit config
nmap("<leader>el", ":e ~/.config/nvim/init.lua<CR>")

-- split movement like tmux
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- swap 0 and ^
nmap("0", "^", { noremap = true })
nmap("^", "0", { noremap = true })

-- fix q:
nmap("q:", ":q<CR>")

-- scroll <C-d> → <C-b>
nmap("<C-d>", "<C-b>")

-- clear search highlight
nmap("<leader><Space>", ":noh<CR>")

-- % on <Tab>
nmap("<Tab>", "%")
vmap("<Tab>", "%")

-- semicolon acts as colon
nmap(";", ":")

-- toggle number lines
nmap("<leader>n",  ":set number<CR>")
nmap("<leader>nn", ":set nonumber<CR>")

-- disable Ex mode
map("", "Q", "gq")

----------------------------------------------------------------
--                                                             --
--   4.  lazy-nvim + plugins                                   --
--                                                             --
----------------------------------------------------------------
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
                  "https://github.com/folke/lazy.nvim.git",
                  "--branch=stable", lazy_path })
end
opt.rtp:prepend(lazy_path)

local plugins = {
  { "lewis6991/gitsigns.nvim" },
  { "github/copilot.vim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" } },
  { "numToStr/Comment.nvim" },
  { "maxmx03/solarized.nvim", lazy = false, priority = 1000,
    opts = {
      on_highlights = function(colors)
        return { Visual = { bg = colors.base02, standout = true } }
      end,
    },
    config = function(_, opts)
      opt.termguicolors = true
      opt.background = "light"
      require("solarized").setup(opts)
      vim.cmd.colorscheme("solarized")
    end,
  },
  { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "davidmh/cspell.nvim" },
  { "folke/which-key.nvim", event = "VeryLazy",
    init = function() opt.timeout = true; opt.timeoutlen = 300 end },
  { "mhartington/formatter.nvim" },
  { "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<c-x>",  "<cmd>Trouble diagnostics toggle<cr>" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>" },
      -- { "<c-l>", "<cmd>Trouble loclist toggle<cr>" },
      { "<c-q>", "<cmd>Trouble qflist toggle<cr>" },
    },
  },
  { "farmergreg/vim-lastplace" },
  { "ruanyl/vim-gh-line" },
  { "cappyzawa/trim.nvim" },
}

require("lazy").setup(plugins, {})

------------------------------------------------------------
--  plugin setups
------------------------------------------------------------
require("gitsigns").setup()
require("mason").setup()
require("nvim-tree").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "lua_ls","rust_analyzer","pyright","dockerls","vimls","marksman","bashls",
    "jsonls","taplo","yamlls","ruff",
  },
})
require("mason-tool-installer").setup({ ensure_installed = { "cspell" } })
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c","lua","vim","vimdoc","query","markdown","markdown_inline",
    "rust","python","cpp","asm",
  },
  auto_install = true,
})
require("trim").setup({ trim_on_write = false, highlight = true })
require("Comment").setup()
require("formatter").setup({
  filetype = {
    python = { require("formatter.filetypes.python").ruff },
    rust   = { require("formatter.filetypes.rust").rustfmt },
    lua    = { require("formatter.filetypes.lua").stylua },
    ["*"]  = { require("formatter.filetypes.any").remove_trailing_whitespace },
  },
})
require("trouble").setup({
})

-- LSPs --------------------------------------------------------
vim.lsp.config('lua_ls', {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
vim.lsp.enable({
  'lua_ls', 'rust_analyzer', 'pyright', 'dockerls', 'vimls',
  'marksman', 'bashls', 'jsonls', 'taplo', 'yamlls', 'ruff',
})

-- Telescope ---------------------------------------------------
require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "wandb/.*","__pycache__/.*",".git/.*",".venv/.*" },
  },
})
local builtin = require("telescope.builtin")
nmap("<C-p>", builtin.find_files, { desc = "Telescope find files" })
vim.api.nvim_create_user_command("Rg", function() builtin.live_grep() end,
  { desc = "Telescope live grep" })

-- treesitter folding -----------------------------------------
opt.foldmethod = "expr"
opt.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext   = ""

-- diagnostics / code actions
nmap("ca", vim.lsp.buf.code_action, {})

----------------------------------------------------------------
--                                                             --
--   5.  notes & reminders                                     --
--                                                             --
----------------------------------------------------------------
--  •  zR / zM  open/close all folds
--  •  gcc / gc  toggle comments (Comment.nvim)
--  •  <leader>f  file explorer (nvim-tree)
--  •  <c-x>  diagnostics panel (Trouble)
--  •  :Gitsigns toggle_current_line_blame  blame info

-- This is to copy to the local clipboard over SSH using i2copy from iTerm
-- Uncomment this on a remote machine
-- ttyup refers to this custom executable script in PATH:
-- #!/bin/bash
-- parent() { awk '{print $4}' "/proc/$1/stat"; }
-- leader() { awk '{print $6}' "/proc/$1/stat"; }
-- it2copy > "/proc/$(parent $(leader $$))/fd/0"
-- From https://stackoverflow.com/a/73531771/529743
-- vim.g.clipboard = {
-- 	name = "iterm2",
-- 	copy = {
-- 		["+"] = { "ttyup" },
-- 		["*"] = { "ttyup" },
-- 	},
-- 	paste = {
-- 		["+"] = { "+" },
-- 		["*"] = { "*" },
-- 	},
-- 	cache_enabled = 1,
-- }

-- Remember:
-- Open all folds: zR
-- Close all folds: zM
-- Open fold under cursor: zo
-- zz to center cursor on screen
-- :Gitsigns toggle_current_line_blame shows the blame from the git history
-- TODO: Learn how to edit all instances of a variable. This might help:
--     https://github.com/neoclide/coc.nvim/wiki/Multiple-cursors-support
-- Toggle whether the current line is commented: gcc or gc in visual mode
-- Open file explorer: :NvimTreeOpen, or <leader>f
-- Ignore cspell word in file with comment: # cspell:ignore word
-- ctrl-x to open trouble diagnostics window

-- TODO:
-- I would love a single keyboard shortcut to ignore the diagnostic message on any current or selected
--     line. For example add to cspell.json, add to codespell ignore words, add to ruff ignore, etc.
-- Get pyright autocomplete suggestions -> maybe from coq.nvim?
-- Consider adding debugger as described here: https://youtu.be/4BnVeOUeZxc?feature=shared&t=740
-- There's an issue with null-ls mypy when creating a new empty file with `nvim` from the command
--     line where it will immediately run the linter on the path which doesn't exist on the file
--     system yet and it will show an error message
