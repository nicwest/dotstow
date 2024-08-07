
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

vim.g["conjure#filetypes"] = {"clojure"}
require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "Olical/conjure", name = 'conjure' },
    { "dense-analysis/ale", name ='ALE' },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    { "stevearc/oil.nvim", name ='oil' },
    { "wellle/targets.vim", name='targets' },
    { "nvim-treesitter/nvim-treesitter", name='treesitter'},
    { "HiPhish/rainbow-delimiters.nvim", name='rainbow-delimiters'},
    { "m4xshen/autoclose.nvim", name='autoclose'},
    { "numToStr/Comment.nvim", lazy = false, name = 'comment'},
})

vim.cmd.colorscheme "catppuccin"
vim.opt.backspace='indent,eol,start'
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.wildmode='longest:full,full'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.encoding='utf-8'
vim.opt.colorcolumn='80'
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.laststatus=2
vim.opt.clipboard='unnamed'
vim.opt.spelllang='en_gb'
vim.opt.mouse = ""


vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' ' 
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set({'n', 'v'}, 'L', '$')
vim.keymap.set({'n', 'v'}, 'H', '^')
vim.keymap.set({'n', 'v'}, '$', 'L')
vim.keymap.set({'n', 'v'}, '^', 'H')

vim.keymap.set('n', 'Q', '@q')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('v', '<', '<V`]')
vim.keymap.set('v', '>', '>V`]')
vim.keymap.set({'n', 'v'}, '<tab>', '%')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'cx', 'xp ')

vim.keymap.set('n', '<space><BS>', ':noh<cr>')
vim.keymap.set('n', '<space>w', ':w<CR>')
vim.keymap.set('n', '<space><Tab>', '<C-^>')
vim.keymap.set('n', '<space>S', '<C-w>v<C-w>l')
vim.keymap.set('n', '<space><leader>', 'za')
vim.keymap.set('n', '<space>r', 'zr')
vim.keymap.set('n', '<space>m', 'zm')

vim.keymap.set('n', '<space>so', ':setlocal spell!<cr>')
vim.keymap.set('n', '<space>sa', 'zg')
vim.keymap.set('n', '<space>ss', 'z=')
vim.keymap.set('n', '<space>sg', '1z=')

vim.g.ale_linters = {
    ['clojure']={ 'clj-kondo' }
}
vim.g.ale_fixers = {
    ['rust']={'rustfmt'}
}
vim.g.ale_fix_on_save = 1
vim.g.ale_pattern_options = {['conjure-log.*.cljc']={['ale_enabled'] = 0}}
vim.keymap.set('n', '[w', '<Plug>(ale_previous_wrap)')
vim.keymap.set('n', ']w', '<Plug>(ale_next_wrap)')


require("oil").setup()
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "clojure", "lua", "python", "go", "rust"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
 -- highlight = {
 --     'RainbowDelimiterRed',
 --     'RainbowDelimiterYellow',
 --     'RainbowDelimiterBlue',
 --     'RainbowDelimiterOrange',
 --     'RainbowDelimiterGreen',
 --     'RainbowDelimiterViolet',
 --     'RainbowDelimiterCyan',
 -- },
}
require("autoclose").setup()
require("Comment").setup()

