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
    { "neovim/nvim-lspconfig", name='lspconfig'},
    { "Olical/conjure", name = 'conjure' },
--    { "dense-analysis/ale", name ='ALE' },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    { "stevearc/oil.nvim", name ='oil' },
    { "wellle/targets.vim", name='targets' },
    { "nvim-treesitter/nvim-treesitter", name='treesitter'},
--    { "HiPhish/rainbow-delimiters.nvim", name='rainbow-delimiters'},
    { "m4xshen/autoclose.nvim", name='autoclose'},
    { "numToStr/Comment.nvim", lazy = false, name = 'comment'},
    { "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            telescope.setup({})
            telescope.load_extension("live_grep_args")
 
            vim.keymap.set('n', '<leader>fr', builtin.resume, {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    { "f-person/git-blame.nvim", name='git-blame',
        opts = {
            enabled = false,
            message_template = "<date> • <author> • <<sha>> • <summary>",
            date_format = "%Y-%m-%d %H:%M",
            virtual_text_column = 1,
        }
    },

    -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' }
    -- },
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
vim.opt.clipboard='unnamedplus'
vim.opt.spelllang='en_gb'
vim.opt.mouse = ""


vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' ' 
vim.g.clipboard = {
    ['name']='WSL',
    ['copy']={
        ['+'] = {'win32yank.exe', '-i'},
        ['*'] = {'win32yank.exe', '-i'},
    },
    ['paste']={
        ['+'] = {'win32yank.exe', '-o'},
        ['*'] = {'win32yank.exe', '-o'},
    }
}

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
vim.keymap.set('n', '<space>gb', ':GitBlameToggle<cr>')
vim.keymap.set('n', '<space>uu', ':r!uuidgen<cr>')

vim.keymap.set('n', 'grn', ':lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'grr', ':lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<space>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.g.ale_linters = {
    ['clojure']={ 'clj-kondo' },
    ['python']={'pyright'},
}
-- vim.g.ale_fixers = {
--     ['rust']={'rustfmt'},
-- }
-- vim.g.ale_fix_on_save = 1
vim.g.ale_pattern_options = {['conjure-log.*.cljc']={['ale_enabled'] = 0}}
-- vim.keymap.set('n', '[w', '<Plug>(ale_previous_wrap)')
-- vim.keymap.set('n', ']w', '<Plug>(ale_next_wrap)')

require("oil").setup()
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "clojure", "lua", "python", "go"},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- local rainbow_delimiters = require 'rainbow-delimiters'
--
-- vim.g.rainbow_delimiters = {
--     strategy = {
--         [''] = rainbow_delimiters.strategy['global'],
--         make = rainbow_delimiters.strategy['noop'],
--     },
--     query = {
--         [''] = 'rainbow-delimiters',
--         lua = 'rainbow-blocks',
--     },
--  -- highlight = {
--  --     'RainbowDelimiterRed',
--  --     'RainbowDelimiterYellow',
--  --     'RainbowDelimiterBlue',
--  --     'RainbowDelimiterOrange',
--  --     'RainbowDelimiterGreen',
--  --     'RainbowDelimiterViolet',
--  --     'RainbowDelimiterCyan',
--  -- },
-- }
require("autoclose").setup()
require("Comment").setup()
require("lspconfig").pyright.setup{}
-- require("lualine").setup()


vim.cmd("source /home/nic/.config/nvim/pydiff.vim")
