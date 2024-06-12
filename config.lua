-- disable netrw at the very start of your init.lua
-- nvim-tree.lua requested this
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Inspired by https://rdrn.me/neovim/
-- lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Find plugins: https://github.com/rockerBOO/awesome-neovim
local plugins = {
	{ "lewis6991/gitsigns.nvim" }, -- show lines with git diff in the gutter
	{ "github/copilot.vim" }, -- LLM autocomplete
	{ "williamboman/mason.nvim" }, -- LSP manager, activate with :Mason
	{ "williamboman/mason-lspconfig.nvim" }, -- mason config manager
	-- Go to definition with ctrl-]
	-- :LspInfo to see which language servers are running on this buffer
	{ "neovim/nvim-lspconfig" }, -- LSP config manager, used by mason, use ]d and [d to jump to prev and next
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-tree/nvim-tree.lua" }, -- file explorer, open with ctrl-f
	-- Maybe replace fzf with https://github.com/nvim-telescope/telescope.nvim
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	}, -- fuzzy search
	{ "junegunn/fzf.vim" }, -- fuzzy search with ctrl-p
	{ "rmagatti/auto-session" }, -- restore last open file
	{ "numToStr/Comment.nvim" }, -- toggle comments with keystrokes gcc or gc in visual mode
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("solarized")
		end,
	}, -- solarized color scheme
	{ "mfussenegger/nvim-lint" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		{ "mhartington/formatter.nvim" },
	},
	-- consider https://github.com/mhartington/formatter.nvim
	-- consider https://github.com/folke/trouble.nvim
}

require("lazy").setup(plugins, {}) -- Activate with :Lazy
require("gitsigns").setup()
require("mason").setup()
require("nvim-tree").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
	-- Available servers: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"dockerls",
		"vimls",
		"marksman",
		"bashls",
		"jsonls",
		"taplo",
		"yamlls",
		"ruff_lsp",
	},
})
require("lint").linters_by_ft = {
	markdown = { "vale" },
	python = { "ruff" },
}
require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})
require("Comment").setup()
require("formatter").setup({
	-- See the filetype configurations https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
	filetype = {
		python = {
			require("formatter.filetypes.python").ruff,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	-- group = "__formatter__",
	command = ":FormatWrite",
})

-- nvim-lint autolint on save
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()

		-- You can call `try_lint` with a linter name or a list of names to always
		-- run specific linters, independent of the `linters_by_ft` configuration
		require("lint").try_lint("cspell")
	end,
})
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.pyright.setup({})
lspconfig.dockerls.setup({})
lspconfig.vimls.setup({})
lspconfig.marksman.setup({})
lspconfig.bashls.setup({})
lspconfig.jsonls.setup({})
lspconfig.taplo.setup({})
lspconfig.yamlls.setup({})
lspconfig.ruff_lsp.setup({})
