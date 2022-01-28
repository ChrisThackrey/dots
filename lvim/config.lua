--[[
lvim is the global options object
]]

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.transparent_window = true
lvim.line_wrap_cursor_movement = true
lvim.colorscheme = "nightfox"
lvim.leader = "space"

-- Sidebar like windows like NvimTree get a darker background
vim.g.tokyonight_dark_sidebar = true
-- Float windows like the lsp diagnostics windows get a darker background
vim.g.tokyonight_dark_float = true
-- Enable this to disable setting the background color
vim.g.tokyonight_transparent = true
-- Sidebar like windows like NvimTree get a transparent background
vim.g.tokyonight_transparent_sidebar = true

lvim.lsp.automatic_servers_installation = true

-- Plenty of vim addons execute fish-incompatible shellscript, so setting it to /bin/sh is typically better
if vim.fn.executable("/usr/bin/bash") then
	vim.o.shell = "/usr/bin/bash"
end

vim.g.transparent_background = true
vim.g.italic_comments = false
vim.g.italic_keywords = false
vim.g.italic_functions = false
vim.g.italic_variables = false

-- christianchiarulli/nvcode-color-schemes.vim
-- vim.g.nvcode_termcolors = 256

vim.g.lightspeed_enable_highlight = 1

vim.g.user_emmet_mode = "i"
vim.g.user_emmet_leader_key = "<C-J>"

-- unblevable/quick-scope
-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
vim.g.qs_buftype_blacklist = { "terminal", "nofile" }
vim.g.qs_filetype_blacklist = { "dashboard", "startify" }
-- vim.g.qs_hi_priority = 2
vim.g.qs_max_chars = 800 -- default: 1000

-- dstein64/nvim-scrollview
vim.g.scrollview_excluded_filetypes = { "dashboard", "startify" }
vim.g.scrollview_winblend = 0

-- RRethy/vim-illuminate
vim.g.Illuminate_delay = 400

-- junegunn/vim-easy-align
vim.g.easy_align_bypass_fold = 1

-- vim-minimap plugin
vim.g.minimap_show = "<leader>Ms"
vim.g.minimap_update = "<leader>Mu"
vim.g.minimap_close = "<leader>Mc"
vim.g.minimap_toggle = "<leader>Mt"

-- vim-lastplace plugin
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit" -- Configure file types to ignore
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help" -- Configure buffer types to ignore
vim.g.lastplace_open_folds = 0 -- Closed folds are automatically opened when jumping to the last edit position

-- nerdcommenter
vim.g.NERDCreateDefaultMappings = 0

-- nvim-lspfuzzy plugin
vim.g.fzf_preview_window = { "down:+{2}-/2" }

-- rust-lang/rust.vim plugin
vim.g.rust_clip_command = "xclip -selection clipboard"

-- vim-svelte
vim.g.svelte_preprocessor_tags = { { "name=postcss", "tag=style", "as=scss" } }
vim.g.svelte_preprocessors = { "typescript", "scss", "postcss" }

-- Force writing the current buffer by calling sudo
vim.cmd("cmap w!! w !sudo tee % >/dev/null")

-- KEYMAPPINGS --
-- [view all the defaults by pressing <leader>Lk]
--
-- Modes
--    normal_mode = "n",
--    insert_mode = "i",
--    visual_mode = "v",
--    visual_block_mode = "x",
--    term_mode = "t",
--    command_mode = "c",
--    operator_pending_mode = "o",
--
-- NORMAL --
-- edit a default keymapping
-- vim.cmd "nnoremap <leader><leader> <c-^>"
-- vim.cmd([[

-- ]])

vim.cmd([[
  fun! Togglequotes()
    if (strcharpart(strpart(getline("."), col(".") - 1), 0, 1) == '"')
      normal cs"'
    elseif (strcharpart(strpart(getline("."), col(".") - 1), 0, 1) == "'")
      normal cs'"hl
    end
  endfun
  nnoremap <leader>' :call Togglequotes()<CR>
]])

-- vim.api.nvim_set_keymap("n", "<leader>'", "<ESC>A;<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ">>_", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<_", { noremap = true })
-- vim.api.nvim_set_keymap("v", ":", ";", { noremap = true })
-- vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", ":", ";", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", ":", ";", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", ";", ":", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", ";", ":", { noremap = true, silent = true })
lvim.keys.normal_mode["<leader><leader>"] = "<c-^>"
lvim.keys.normal_mode["<C-q>"] = ":q<CR>"
lvim.keys.normal_mode["<Esc>"] = "$"
lvim.keys.normal_mode["d"] = '"_d'
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "d", '"_d', { noremap = true, silent = true })
lvim.keys.normal_mode["<leader>q"] = "<Plug>(QuickScopeToggle)<CR>"
vim.api.nvim_set_keymap("v", "<leader>q", "<Plug>(QuickScopeToggle)<CR>", { silent = true })
vim.api.nvim_set_keymap("x", "<leader>q", "<Plug>(QuickScopeToggle)<CR>", { silent = true })
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-p>"] = ""
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
-- Searchbox plugin
lvim.keys.normal_mode["<leader>F"] = ":lua require('searchbox').incsearch()<CR>"
-- Move to the nearest exact match without any fuss
lvim.keys.normal_mode["<leader><C-d>"] = ":SearchBoxSimple exact=true<CR>"
-- Start a search and replace
lvim.keys.normal_mode["<leader>S"] = ":SearchBoxReplace confirm=menu<CR>"
-- Use the word under the cursor to begin search and replace
lvim.keys.normal_mode["<leader>R"] = ":SearchBoxReplace confirm=menu -- <C-r>=expand('<cword>')<CR><CR>"
-- Look for the exact word under the cursor
lvim.keys.normal_mode["<leader>m"] =
	":SearchBoxMatchAll exact=true clear_matches=true -- <C-r>=expand('<cword>')<CR><CR>"
-- Better window navigation
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent = true})
-- Clear the highlighting of hlsearch.
if vim.fn.has("nvim-0.6") == 0 then
	vim.api.nvim_set_keymap(
		"n",
		"<C-l>",
		":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>",
		{ noremap = true, silent = true }
	)
end
-- Strip trailing whitespace.
vim.api.nvim_set_keymap(
	"n",
	"<F5>",
	":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>",
	{ noremap = true, silent = true }
)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
-- Copy full line(s) down
lvim.keys.normal_mode["<leader>j"] = "yyp"
-- Copy full line(s) up
lvim.keys.normal_mode["<leader>k"] = "yyPe"
-- Toggle Ranger file explorer plugin
lvim.keys.normal_mode["<leader>a"] = ":RnvimrToggle<CR>"
-- nvim-select-multi-line
lvim.keys.normal_mode["<leader>v"] = ":call sml#mode_on()<CR>"
lvim.keys.normal_mode["<leader>V"] = ":call sml#mode_off()<CR>"
-- vim-visual-multi
lvim.keys.normal_mode["<C-J>"] = ":call vm#commands#add_cursor_down(1, 1)<CR>"
lvim.keys.normal_mode["<C-K>"] = ":call vm#commands#add_cursor_up(1, 1)<CR>"

-- Clear search highlighting & clear the minimap highlights
vim.api.nvim_set_keymap(
	"n",
	"<leader>`",
	":nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>",
	{ noremap = true, silent = true }
)
-- Vim-Easy-Align
-- EasyAlign for a motion/text object (e.g. gaip)
lvim.keys.normal_mode["ga"] = "<Plug>(EasyAlign)<CR>"
-- rmagatti/goto-preview
vim.api.nvim_set_keymap(
	"n",
	"gtd",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gti",
	"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gtr",
	"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "gtw", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
-- Package-Info Plugin
-- Show package versions
vim.api.nvim_set_keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })
-- Hide package versions
vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })
-- Update package on line
vim.api.nvim_set_keymap(
	"n",
	"<leader>nu",
	":lua require('package-info').update()<CR>",
	{ silent = true, noremap = true }
)
-- Delete package on line
vim.api.nvim_set_keymap(
	"n",
	"<leader>nd",
	":lua require('package-info').delete()<CR>",
	{ silent = true, noremap = true }
)
-- Install a new package
vim.api.nvim_set_keymap(
	"n",
	"<leader>ni",
	":lua require('package-info').install()<CR>",
	{ silent = true, noremap = true }
)
-- Reinstall dependencies
vim.api.nvim_set_keymap(
	"n",
	"<leader>nr",
	":lua require('package-info').reinstall()<CR>",
	{ silent = true, noremap = true }
)
-- Install a different package version
vim.api.nvim_set_keymap(
	"n",
	"<leader>np",
	":lua require('package-info').change_version()<CR>",
	{ silent = true, noremap = true }
)

-- Open a Terminal --
-- vim.cmd[[
--   nmap <unique> <silent> <C-s> <Plug>(PrimaryTerminalOpenDynamic)
--   tmap <unique> <silent> <C-s> <C-\><C-n><C-w>c
--   autocmd TermOpen * startinsert
--   autocmd BufEnter term://* startinsert
-- ]]

-- Escape exits insert mode inside terminal.
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- INSERT --
-- Copy full line(s) down
lvim.keys.insert_mode["<C-d>"] = "<C-o>yy<C-o>p"
-- Copy full line(s) up
lvim.keys.insert_mode["<C-D>"] = "<C-o>yy<C-o>P"
-- Enter a new line below
-- lvim.keys.insert_mode["<C-\[>"] = "<C-o>o"
-- Enter a new line above
-- lvim.keys.insert_mode["<C-\]>"] = "<C-o>O"
-- Insert a new line below
-- lvim.keys.insert_mode["<C-{>"] = "<C-o>o<Esc>ki"
-- Insert a new line above
-- lvim.keys.insert_mode["<C-}>"] = "<C-o>O<Esc>ji"
-- Toggle comment
vim.api.nvim_set_keymap("i", "<C-_>", "<Esc>:Commentary<CR>i", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-_>", ":Commentary<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-_>", ":Commentary<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<C-_>", ":Commentary<CR>", { noremap = true, silent = true })
-- Expand spacing
-- lvim.keys.insert_mode['<C-@'] = '  <C-o>h'
-- Github Copilot
vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<A-\\>", 'copilot#Accept("")', { expr = true, silent = true })
-- LSPSaga
--
-- vim.api.nvim_set_keymap('i', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })

-- VISUAL --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- -- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "p", "_dP", { noremap = true, silent = true })
-- Vim-Easy-Align
-- Start EasyAlign in visual mode (e.g. vipga)
vim.api.nvim_set_keymap("v", "ga", "<Plug>(EasyAlign)<CR>", { noremap = true, silent = true })

-- VISUAL BLOCK --
-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
-- Vim-Easy-Align
-- Start EasyAlign in visual mode (e.g. vipga)
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)<CR>", { noremap = true, silent = true })

-- TERMINAL --
-- Open a Floating Terminal (FTerm) --
vim.api.nvim_set_keymap(
	"n",
	"<leader><A-i>",
	'<CMD>lua require("FTerm").toggle()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"t",
	"<leader><A-i>",
	'<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
	{ noremap = true, silent = true }
)
-- Better terminal navigation
-- vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
-- vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
-- vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
-- vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })
-- NNN File Explorer / Picker
-- vim.api.nvim_set_keymap("t", "<C-A-n>", "<cmd>NnnExplorer<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<C-A-p>", "<cmd>NnnPicker<CR>", { noremap = true, silent = true })

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
-- https://github.com/zeertzjq/which-key.nvim/commit/7815ae48927420f49e3826ae4c98d2d467c9fe7f
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- Searchbox plugin
lvim.builtin.which_key.vmappings["m"] = {
	name = "Searchbox",
	a = {
		'<Esc>:lua require("searchbox").match_all({title="Match All", clear_matches=true, visual_mode=true})<CR>',
		"Match All",
	},
	m = {
		":SearchBoxReplace exact=true confirm=menu visual_mode=true<CR>",
		"Search and replace for exact matches",
	},
	r = {
		'y:SearchBoxReplace confirm=menu -- <C-r>"<CR>',
		"Search and replace with expanded selection",
	},
	s = {
		"<Esc>:lua require('searchbox').incsearch({visual_mode = true})<cr>",
		"Incremental search with selected text",
	},
}

--[[ ThePrimeagen/refactoring.nvim ]]
lvim.builtin.which_key.mappings["r"] = {
	name = "Refactorings: Debug",
	c = {
		":lua require('refactoring').debug.cleanup({})<CR>",
		"Debug: Cleanup",
	},
	p = {
		":lua require('refactoring').debug.printf({below = false})<cr>",
		"Debug: Print",
	},
}
lvim.builtin.which_key.vmappings["r"] = {
	name = "refactorings",
	e = {
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
		"Extract Function",
	},
	f = {
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
		"Extract Function To File",
	},
	i = {
		[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
		"Inline Variable",
	},
	o = {
		":lua require('refactoring').debug.print_var({})<CR>",
		"Debug: Print variable",
	},
	r = {
		"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
		"Telescope Mode",
	},
	v = {
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
		"Extract Variable",
	},
}
-- Remaps for each of the four debug operations currently offered by the plugin
vim.api.nvim_set_keymap(
	"v",
	"<Leader>re",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>rf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>rv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>ri",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.api.nvim_set_keymap(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true }
)
-- Print var: this remap should be made in visual mode
vim.api.nvim_set_keymap("v", "<leader>ro", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })
-- Cleanup function: this remap should be made in normal mode
vim.api.nvim_set_keymap("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.cmp.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.notify.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.gitsigns.active = true
lvim.builtin.project.active = true
lvim.builtin.which_key.active = true
lvim.builtin.comment.active = true
lvim.builtin.telescope.active = true
lvim.builtin.nvimtree.active = true
lvim.builtin.lualine.active = false

lvim.builtin.which_key.setup.layout.height = { min = 6, max = 30 } -- min and max height of the columns

---extended mapping
---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
lvim.builtin.comment.mappings.extra = true

lvim.builtin.cmp.confirm_opts.select = true
lvim.builtin.cmp.completion.keyword_length = 1 ---@usage The minimum length of a word to complete on
-- lvim.builtin.cmp.experimental.native_menu = true
lvim.builtin.cmp.formatting.source_names = {
	nvim_lsp = "(LSP)",
	treesitter = "(Treesitter)",
	omni = "(Omni)",
	vsnip = "(Snippet)",
	luasnip = "(Snippet)",
	path = "(Path)",
	buffer = "(Buffer)",
	calc = "(Calc)",
	emoji = "(Emoji)",
}
-- cmp_openai_codex = "Codex",
-- nvim_lua = "(Lua)",
-- cmp_tabnine = "(Tabnine)",
lvim.builtin.cmp.sources = {
	{ name = "nvim_lsp" },
	{ name = "nvim_lua" },
	{ name = "treesitter" },
	{ name = "luasnip", options = { use_show_condition = false } },
	{ name = "vsnip" },
	{ name = "path" },
	{ name = "crates" },
	{ name = "omni" },
	{ name = "buffer" },
	{ name = "calc" },
	{ name = "emoji" },
}
-- { name = "cmp_openai_codex" },
-- { name = "vsnip" },
-- { name = "omni" },
-- { name = "cmp_tabnine" },

lvim.builtin.autopairs.check_ts = true
lvim.builtin.autopairs.ts_config = {
	lua = { "string", "source" },
	javascript = { "string", "template_string" },
	jsx = { "string", "template_string" },
	typescript = { "string", "template_string" },
	tsx = { "string", "template_string" },
	java = false,
}

---@usage check bracket in same line
lvim.builtin.autopairs.enable_check_bracket_line = true
lvim.builtin.autopairs.map_bs = true -- map the <BS> key
lvim.builtin.autopairs.map_c_h = false -- Map the <C-h> key to delete a pair
---@usage map <c-w> to delete a pair if possible
lvim.builtin.autopairs.map_c_w = false
---@usage disable when insert after visual block mode
lvim.builtin.autopairs.disable_in_visualblock = "true"
lvim.builtin.autopairs.offset = 0 -- Offset from pattern match

lvim.builtin.gitsigns.opts.numhl = false

lvim.builtin.project.show_hidden = true
lvim.builtin.project.silent_chdir = true

lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c_sharp",
	"css",
	"dart",
	"dockerfile",
	"fish",
	"go",
	"graphql",
	"html",
	"javascript",
	"jsdoc",
	"json",
	"jsonc",
	"kotlin",
	"lua",
	"make",
	"markdown",
	"perl",
	"php",
	"prisma",
	"pug",
	"python",
	"ruby",
	"rust",
	"scss",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vue",
	"yaml",
}
lvim.builtin.treesitter.autotag.enable = true

-- Generic LSP settings
--
-- VIM Defaults
vim.opt.confirm = true
vim.opt.autowrite = false
-- vim.o.lazyredraw = true -- Don't redraw while typing macros
vim.opt.termguicolors = true -- Use terminal colors
-- vim.bo.textwidth  = 80 -- 80 character limit
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noinsert", "noselect" } -- "noinsert", "noselect", "menuone", "menu", "longest", "preview"
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
-- Make file messages even shorter and messier.
-- vim.o.shortmess = 'filnxrtToOF'
vim.wo.foldmethod = "expr" -- folding set to "expr" for treesitter based folding (options: "manual", "indent": default, "marker", "expr")
vim.wo.foldnestmax = 4
vim.wo.foldminlines = 1
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldlevelstart = 10
-- vim.wo.fillchars = "fold:\\"
-- Message pager does not fill entire screen.
-- See https://github.com/neovim/neovim/pull/8088
vim.o.fillchars = "msgsep:◌"
vim.wo.foldenable = true -- enable folding
vim.o.foldtext =
	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.guifont = "Hasklug Nerd Font Mono Regular:h18:antialias=true:hint=true:hintwidth=true" -- the font used in graphical neovim applications
-- vim.opt.guifont = "Lilex Nerd Font Mono:h28:antialias=true:hint=true:hintwidth=true:pixelsize=13"
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.o.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height (default is 10)
vim.opt.updatetime = 100 -- update time for autocommand
vim.opt.infercase = true
vim.o.incsearch = true -- search for the next match
vim.opt.grepformat = "%f:%l:%c:%m"
-- Use ripgrep as external grep tool, if available.
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = 'rg --no-heading --vimgrep --smart-case --glob "!{.git,node_modules,*~}/*" --'
end
vim.opt.wrap = false -- display lines as one long line
vim.opt.wrapscan = true -- wrap around the buffer
vim.opt.inccommand = "nosplit" -- don't split the window when searching
vim.opt.smarttab = true
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- soft tabs equal two spaces
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.scrolloff = 4 -- is one of my fav
vim.opt.sidescrolloff = 2
vim.opt.backspace = "indent,eol,start"
vim.opt.history = 6000
vim.opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
vim.opt.synmaxcol = 2048
vim.opt.endofline = false
vim.opt.more = true
-- Message popup is slightly transparent.
vim.opt.pumblend = 10
-- Highlight invisible whitespace.
vim.opt.list = true
vim.cmd("set listchars=tab:¤‒,trail:§,extends:…,precedes:…,nbsp:‡")
-- vim.cmd("set listchars=eol:§,tab:‒‒,trail:■,extends:…,precedes:…,nbsp:‡")
-- vim.cmd("set listchars=eol:¬,tab:→-,trail:·,extends:…,precedes:…")
-- vim.cmd("set listchars=eol:§,tab:¤›,trail:∙,extends:»,precedes:«,nbsp:‡")
-- vim.cmd("set listchars=eol:§,tab:→→,trail:■,extends:…,precedes:…,nbsp:‡")
-- vim.cmd("set listchars=eol:§,tab:■■,trail:■,extends:❯,precedes:❮,nbsp:‡")
vim.opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
-- Set hard wrapping guide.
-- vim.o.colorcolumn = '100'
-- Diff options.
vim.o.diffopt = "internal,filler,vertical,algorithm:patience"
-- Enable syntax highlighting for JSDoc.
vim.g.javascript_plugin_jsdoc = 1
vim.opt.wildignore:append("*/node_modules/*,*/vendor/*,*/venv/*,*/.venv/*,*/target/*,*/cache/*,*/tmp/*")
vim.opt.errorformat:append("%f|%l col %c|%m")

-- Additional Plugins  (disabled: [~/.config/lvim/plugin/disabled.lua])
lvim.plugins = {
	-- [https://github.com/LunarVim/Colorschemes]
	-- {
	-- 	"lunarvim/colorschemes",
	-- 	branch = "master",
	-- },
	-- [https://github.com/folke/tokyonight.nvim]
	{
		"folke/tokyonight.nvim",
		branch = "main",
		requires = { { "nvim-lua/plenary.nvim" }, { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
		config = function()
			-- local colors = require("tokyonight").colors
			vim.g.tokyonight_style = "storm" -- "storm", "night", "day"
			-- Configure the colors used when opening a :terminal
			vim.g.tokyonight_terminal_colors = false
			vim.g.tokyonight_italic_comments = false
			vim.g.tokyonight_italic_keywords = false
			vim.g.tokyonight_italic_functions = false
			vim.g.tokyonight_italic_variables = false
			-- Set a darker background on sidebar-like windows
			vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
			-- vim.g.tokyonight_colors = { hint = colors.yellow, error = colors.red }
		end,
	},
	-- [https://github.com/EdenEast/nightfox.nvim]
	{
		"EdenEast/nightfox.nvim",
		branch = "main",
		requires = { { "nvim-lua/plenary.nvim" }, { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
		config = function()
			local nightfox = require("nightfox")
			nightfox.setup({
				-- fox = "nightfox", -- nightfox, dayfox, duskfox, nordfox, dawnfox
				transparent = true, -- Disable setting the background color
				alt_nc = true, -- Non current window bg to alt color see `hl-NormalNC`
				terminal_colors = false, -- Configure the colors used when opening :terminal
				styles = {
					comments = "nocombine", -- change style of comments to be italic
					keywords = "nocombine", -- change style of keywords to be bold
					functions = "bold,nocombine",
					strings = "nocombine", -- Style that is applied to strings: see `highlight-args` for options
					variables = "nocombine",
				},
				inverse = {
					match_paren = false, -- Enable/Disable inverse highlighting for match parens
					visual = false, -- Enable/Disable inverse highlighting for visual selection
					search = false, -- Enable/Disable inverse highlights for search highlights
				},
				-- colors = {
				-- red = "#FF000", -- Override the red color for MAX POWER
				-- },
				-- hlgroups = {
				-- TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
				-- LspCodeLens = { style = "italic" },
				-- },
			})
			-- Load the configuration set above and apply the colorscheme
			nightfox.load()
		end,
	},
	-- [https://github.com/liuchengxu/space-vim-theme]
	-- {
	-- 	"liuchengxu/space-vim-theme",
	-- 	branch = "master",
	-- },
	-- [https://github.com/dracula/vim]
	-- {
	-- 	"dracula/vim",
	-- 	as = "dracula",
	-- 	branch = "master",
	-- 	-- config = function()
	-- 	-- 	require("dracula_pro")
	-- 	-- end,
	-- },
	-- SpaceDuck Theme  [https://github.com/bluz71/vim-nightfly-guicolors]
	-- {
	-- 	"bluz71/vim-nightfly-guicolors",
	-- 	branch = "master",
	-- },
	-- [https://github.com/bluz71/vim-moonfly-colors]
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	branch = "master",
	-- },
	-- dims inactive portions of the code you're editing  [https://github.com/folke/twilight.nvim]
	{
		"folke/twilight.nvim",
		branch = "main",
		requires = { { "nvim-treesitter/nvim-treesitter" }, { "EdenEast/nightfox.nvim" } },
		cmd = {
			"Twilight", -- toggle twilight
			"TwilightEnable", -- enable twilight
			"TwilightDisable", -- disable twilight
		},
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.25, -- amount of dimming
					-- we try to get the foreground from the highlight groups or fallback color
					color = { "Normal", "#ffffff" },
					inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
				},
				context = 10, -- amount of lines we will try to show around the current line
				treesitter = true, -- use treesitter when available for the filetype
				-- treesitter is used to automatically expand the visible text,
				-- but you can further control the types of nodes that should always be fully expanded
				expand = {
					-- for treesitter, we we always try to expand to the top-most ancestor with these types
					"function",
					"method",
					"table",
					"if_statement",
				},
				exclude = {}, -- exclude these filetypes
			})
		end,
	},
	-- Distraction-free coding  [https://github.com/folke/zen-mode.nvim]
	{
		"folke/zen-mode.nvim",
		branch = "main",
		requires = {
			{ "folke/twilight.nvim", opt = true },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		cmd = "ZenMode",
		config = function()
			require("zen-mode").setup()
		end,
	},
	-- [https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils]
	-- [https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols]
	-- require'lspconfig'.denols.setup{}
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		-- ft = {
		-- 	"astro",
		-- 	"astro-markdown",
		-- 	"javascript",
		-- 	"javascriptreact",
		-- 	"svelte",
		-- 	"typescript",
		-- 	"typescriptreact",
		-- 	"vue",
		-- },
		config = function()
			local null_ls = require("null-ls")
			-- local lspconfig = require("lspconfig")
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.eslint_d.with({
						prefer_local = "node_modules/.bin",
					}),
					null_ls.builtins.code_actions.eslint_d.with({
						prefer_local = "node_modules/.bin",
					}),
					null_ls.builtins.formatting.eslint_d.with({
						prefer_local = "node_modules/.bin",
					}),
					null_ls.builtins.formatting.prettier_d_slim.with({
						prefer_local = "node_modules/.bin",
					}),
				},
			})
		end,
	},
	-- remaps the . command in a way that plugins can tap into it  [https://github.com/tpope/vim-repeat]
	-- add the following command at the end of your map functions
	-- silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
	{
		"tpope/vim-repeat",
		branch = "master",
		requires = { "nvim-treesitter/nvim-treesitter" },
	},
	-- Visual-Studio-Code-like renaming UI for Neovim, writen in Lua  [https://github.com/filipdutescu/renamer.nvim]
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		config = function()
			local mappings_utils = require("renamer.mappings.utils")
			require("renamer").setup({
				-- The popup title, shown if `border` is true
				title = "Rename",
				-- The padding around the popup content
				padding = {
					top = 0,
					left = 0,
					bottom = 0,
					right = 0,
				},
				-- The minimum width of the popup
				min_width = 20,
				-- The maximum width of the popup
				max_width = 60,
				-- Whether or not to shown a border around the popup
				border = true,
				-- The characters which make up the border
				border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				-- Whether or not to highlight the current word references through LSP
				show_refs = true,
				-- Whether or not to add resulting changes to the quickfix list
				with_qf_list = true,
				-- Whether or not to enter the new name through the UI or Neovim's `input`
				-- prompt
				with_popup = true,
				-- The keymaps available while in the `renamer` buffer. The example below
				-- overrides the default values, but you can add others as well.
				mappings = {
					["<c-i>"] = mappings_utils.set_cursor_to_start,
					["<c-a>"] = mappings_utils.set_cursor_to_end,
					["<c-e>"] = mappings_utils.set_cursor_to_word_end,
					["<c-b>"] = mappings_utils.set_cursor_to_word_start,
					["<c-c>"] = mappings_utils.clear_line,
					["<c-u>"] = mappings_utils.undo,
					["<c-r>"] = mappings_utils.redo,
				},
				-- Custom handler to be run after successfully renaming the word. Receives
				-- the LSP 'textDocument/rename' raw response as its parameter.
				handler = nil,
			})
			vim.api.nvim_set_keymap(
				"i",
				"<F2>",
				'<cmd>lua require("renamer").rename({empty = true})<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rn",
				'<cmd>lua require("renamer").rename({empty = true})<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>rn",
				'<cmd>lua require("renamer").rename({empty = true})<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<F2>",
				'<cmd>lua require("renamer").rename({empty = true})<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<F2>",
				'<cmd>lua require("renamer").rename({empty = true})<cr>',
				{ noremap = true, silent = true }
			)
		end,
	},
	-- View man pages in vim. Grep for the man pages. [https://github.com/vim-utils/vim-man]
	{
		"vim-utils/vim-man",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim", opt = true },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
	},
	-- [https://github.com/mbbill/undotree]
	-- visualizes undo history and makes it easier to browse and switch between different undo branches
	-- nnoremap <F5> :UndotreeToggle<CR>
	{
		"mbbill/undotree",
		branch = "master",
		requires = { { "nvim-treesitter/nvim-treesitter" }, { "EdenEast/nightfox.nvim" } },
		cmd = "UndotreeToggle",
	},
	--[[ nvim-treesitter-textsubjects ]]
	-- Location and syntax aware text objects  [https://github.com/RRethy/nvim-treesitter-textsubjects]
	-- which *do what you mean*
	{
		"RRethy/nvim-treesitter-textsubjects",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				textsubjects = {
					enable = true,
					keymaps = {
						["<cr>"] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
					},
				},
			})
		end,
	},
	-- create your own text objects without pain  [https://github.com/kana/vim-textobj-user]
	-- https://github.com/kana/vim-textobj-user/wiki
	{
		"kana/vim-textobj-user",
		branch = "master",
		requires = { { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
	},
	-- syntax highlighting and indentation for Svelte 3 components  [https://github.com/evanleck/vim-svelte]
	{
		"evanleck/vim-svelte",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-telescope/telescope.nvim" },
			{ "sheerun/vim-polyglot" },
			{ "pangloss/vim-javascript" },
			{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
			{ "EdenEast/nightfox.nvim" },
		},
		ft = {
			"svelte",
			"TelescopePrompt",
			"spectre_panel",
		},
	},
	-- Astro language support  [https://github.com/rajasegar/vim-astro]
	{
		"rajasegar/vim-astro",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-telescope/telescope.nvim" },
			{ "sheerun/vim-polyglot" },
			{ "pangloss/vim-javascript" },
			{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
			{ "EdenEast/nightfox.nvim" },
		},
		-- events = { "BufRead", "BufNewFile", "BufWinEnter" },
		ft = { "astro", "astro-markdown", "TelescopePrompt", "spectre_panel" },
		config = function()
			vim.g.astro_indent_script = 0
			vim.g.astro_indent_style = 0
			-- vim-javascript global options
			vim.g.javascript_plugin_jsdoc = 1
			vim.g.javascript_plugin_flow = 1
			-- vim.g.conceallevel = 1
			vim.g.javascript_conceal_function = "ƒ"
			vim.g.javascript_conceal_null = "ø"
			vim.g.javascript_conceal_this = "@"
			vim.g.javascript_conceal_return = "⇚"
			vim.g.javascript_conceal_undefined = "¿"
			vim.g.javascript_conceal_NaN = "ℕ"
			vim.g.javascript_conceal_prototype = "¶"
			vim.g.javascript_conceal_static = "•"
			vim.g.javascript_conceal_super = "Ω"
			vim.g.javascript_conceal_arrow_function = "⇒"
			vim.g.javascript_conceal_noarg_arrow_function = "🞅"
			vim.g.javascript_conceal_underscore_arrow_function = "🞅"
		end,
	},
	-- provides for motions based on indent depths or levels  [https://github.com/jeetsukumaran/vim-indentwise]
	{
		"jeetsukumaran/vim-indentwise",
		branch = "master",
	},
	requires = {
		{ "nvim-treesitter/nvim-treesitter" },
	},
	-- adds various text objects to give you more targets to operate on  [https://github.com/wellle/targets.vim]
	{
		"wellle/targets.vim",
		branch = "master",
		requires = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	-- [https://github.com/abecodes/tabout.nvim]
	{
		"abecodes/tabout.nvim",
		branch = "master",
		requires = { { "hrsh7th/nvim-cmp" }, { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } }, -- if a completion plugin is using tabs load it before
		event = { "InsertEnter", "BufRead", "BufReadPost" },
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
	},
	-- View Vim marks in the sign column [https://github.com/chentau/marks.nvim]
	{
		"chentau/marks.nvim",
		branch = "master",
		config = function()
			require("marks").setup({
				-- whether to map keybinds or not. default true
				default_mappings = true,
				-- which builtin marks to show. default {}
				builtin_marks = { ".", "<", ">", "^" },
				-- whether movements cycle back to the beginning/end of buffer. default true
				cyclic = true,
				-- whether the shada file is updated after modifying uppercase marks. default false
				force_write_shada = false,
				-- how often (in ms) to redraw signs/recompute mark positions.
				-- higher values will have better performance but may cause visual lag,
				-- while lower values may cause performance penalties. default 150.
				refresh_interval = 250,
				-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
				-- marks, and bookmarks.
				-- can be either a table with all/none of the keys, or a single number, in which case
				-- the priority applies to all marks.
				-- default 10.
				sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
				-- disables mark tracking for specific filetypes. default {}
				excluded_filetypes = {},
				-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
				-- sign/virttext. Bookmarks can be used to group together positions and quickly move
				-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
				-- default virt_text is "".
				bookmark_0 = {
					sign = "⚑",
					virt_text = "hello world",
				},
				mappings = {},
			})
		end,
	},
	-- No-nonsense floating terminal plugin for neovim  [https://github.com/numtostr/FTerm.nvim]
	{
		"numtostr/FTerm.nvim",
		branch = "master",
	},
	-- [https://github.com/github/copilot.vim]
	-- {
	-- 	"github/copilot.vim",
	-- 	branch = "release",
	-- },
	-- Github Copilot Feature:Suggestion-Cycling Branch
	-- [https://github.com/Lucklyric/copilot.vim/tree/feat/cycling-alternate-suggestions]
	{
		"Lucklyric/copilot.vim",
		branch = "feat/cycling-alternate-suggestions",
		event = { "InsertEnter", "BufRead", "BufReadPost" },
	},
	-- VSCode(LSP)'s snippet feature in vim.  [https://github.com/hrsh7th/vim-vsnip/blob/master/README.md#2-setting]
	{
		"hrsh7th/vim-vsnip",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/vim-vsnip-integ" },
			{ "EdenEast/nightfox.nvim" },
		},
		event = { "InsertEnter", "BufRead", "BufReadPost" },
	},
	-- nvim-cmp source for vim's cmdline.  [https://github.com/hrsh7th/cmp-cmdline]
	{
		"hrsh7th/cmp-cmdline",
		branch = "main",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "EdenEast/nightfox.nvim" },
		},
		event = { "InsertEnter", "BufRead", "BufReadPost" },
		config = function()
			require("cmp").setup.cmdline(":", {
				sources = {
					{ name = "cmdline" },
				},
			})
			require("cmp").setup.cmdline("/", {
				sources = {
					{
						name = "buffer",
						option = {
							keyword_pattern = [[\k\+]],
						},
					},
				},
			})
		end,
	},
	--[[quick-scope]]
	-- An always-on highlight for a unique character in every word on a line to help you use f, F and family
	-- [https://github.com/unblevable/quick-scope]
	{
		"unblevable/quick-scope",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
	},
	-- [https://github.com/norcalli/nvim-colorizer.lua]
	{
		"norcalli/nvim-colorizer.lua",
		branch = "master",
		event = { "BufWinEnter", "BufRead", "BufReadPost" },
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	-- The Refactoring library based off the Refactoring book by Martin Fowler  [https://github.com/ThePrimeagen/refactoring.nvim]
	{
		"ThePrimeagen/refactoring.nvim",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-telescope/telescope.nvim", opt = true },
		},
		-- event = { "InsertEnter", "BufRead", "BufReadPost" },
		config = function()
			require("refactoring").setup({
				-- prompt for return type
				prompt_func_return_type = {
					go = true,
				},
				-- prompt for function parameters
				prompt_func_param_type = {
					go = true,
					cpp = true,
					c = true,
				},
			})
			-- load refactoring Telescope extension
			require("telescope").load_extension("refactoring")
		end,
	},
	-- motion plugin based on incremental fuzzy search  [https://github.com/rlane/pounce.nvim]
	-- No mappings are created by default
	{
		"rlane/pounce.nvim",
		branch = "master",
		requires = { { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" }, { "tpope/vim-repeat" } },
		-- event = { "BufRead", "BufReadPost" },
		config = function()
			require("pounce").setup({
				accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
				debug = false,
			})
			vim.cmd("nmap s <cmd>Pounce<CR>")
			vim.cmd("vmap s <cmd>Pounce<CR>")
			vim.cmd("omap gs <cmd>Pounce<CR>") -- 's' is used by vim-surround
		end,
	},
	-- [https://github.com/p00f/nvim-ts-rainbow]
	{
		"p00f/nvim-ts-rainbow",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = false,
					disable = { "astro", "astro-markdown" }, -- list of languages you want to disable the plugin for
					extended_mode = true,
					max_file_lines = 4000,
					colors = {
						"#ebff87",
						"#da70d6",
						"#58cdff",
						"#c4b5fd",
						"#93c5fd",
						"#20e3b2",
					},
				},
			})
		end,
	},
	-- File Jumping/Global Marks [https://github.com/ThePrimeagen/harpoon]
	{
		"ThePrimeagen/harpoon",
		branch = "master",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- [https://github.com/nvim-telescope/telescope-media-files.nvim]
	{
		"nvim-telescope/telescope-media-files.nvim",
		branch = "master",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("media_files")
		end,
	},
	-- [https://github.com/sindrets/diffview.nvim]
	{
		"sindrets/diffview.nvim",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "kyazdani42/nvim-web-devicons", opt = true },
		},
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
		},
		config = function()
			require("diffview").setup()
		end,
	},
	-- [https://github.com/TimUntersberger/neogit]
	{
		"TimUntersberger/neogit",
		branch = "master",
		requires = { "nvim-lua/plenary.nvim" },
		cmd = "Neogit",
		config = function()
			require("neogit").setup({ integrations = { diffview = true } })
		end,
	},
	-- a better terminal buffer experience  [https://github.com/curist/split-term.vim]
	{
		"curist/split-term.vim",
		branch = "master",
		cmd = { "Term", "VTerm", "TTerm" },
		config = function()
			vim.g.split_term_default_shell = "fish"
			vim.g.disable_key_mappings = 1
		end,
	},
	-- [https://github.com/christoomey/vim-tmux-navigator]
	-- navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
	{
		"christoomey/vim-tmux-navigator",
		branch = "master",
		cmd = "TmuxNavigator",
		config = function()
			vim.g.tmux_navigator_no_mappings = 1
			vim.g.tmux_navigator_preserve_zoom = 1
		end,
	},
	-- [https://github.com/SmiteshP/nvim-gps]
	{
		"SmiteshP/nvim-gps",
		branch = "master",
		-- event = { "BufRead", "BufReadPost" },
		requires = { { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
		config = function()
			require("nvim-gps").setup()
		end,
	},
	-- [http://neovimcraft.com/plugin/NTBBloodbath/galaxyline.nvim/index.html]
	{
		"NTBBloodbath/galaxyline.nvim", -- 'CosmicNvim/galaxyline.nvim'
		branch = "main",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
			{ "SmiteshP/nvim-gps" },
		},
		config = function()
			require("cosmic.core.statusline")
		end,
	},
	-- EditorConfig plugin for Vim  [https://github.com/editorconfig/editorconfig-vim]
	-- {
	--     "editorconfig/editorconfig-vim",
	--     branch = "master",
	--     config = function()
	--         vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}
	--     end,
	-- },
	-- A code outline window for skimming and quick navigation  [https://github.com/stevearc/aerial.nvim]
	{
		"stevearc/aerial.nvim",
		branch = "master",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					-- Toggle the aerial window with <leader>a
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
					-- Jump forwards/backwards with '{' and '}'
					vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
					-- Jump up the tree with '[[' or ']]'
					vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
				end,
			})
		end,
	},
	-- Create your own pair objects using tree-sitter queries!  [https://github.com/theHamsta/nvim-treesitter-pairs]
	-- Pairs are configured via queries/<language>/pairs.scm query files
	{
		"theHamsta/nvim-treesitter-pairs",
		branch = "master",
		requires = { { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
		config = function()
			require("nvim-treesitter.configs").setup({
				pairs = {
					enable = true,
					disable = {},
					highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
					highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
					goto_right_end = false, -- whether to go to the end of the right partner or the beginning
					fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
					keymaps = {
						goto_partner = "<leader>%",
						delete_balanced = "X",
					},
					delete_balanced = {
						only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
						fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
						longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
						-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
					},
				},
			})
		end,
	},
	-- simple, easy-to-use Vim alignment plugin  [https://github.com/junegunn/vim-easy-align]
	{
		"junegunn/vim-easy-align",
		branch = "master",
		event = { "BufRead", "BufReadPost" },
	},
	-- A git commit browser.  [https://github.com/junegunn/gv.vim]
	-- :GV to open commit browser
	{
		"junegunn/gv.vim",
		branch = "master",
		requires = { "tpope/vim-fugitive" },
	},
	-- [https://github.com/sudormrfbin/cheatsheet.nvim]
	{
		"sudormrfbin/cheatsheet.nvim",
		branch = "master",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("cheatsheet").setup({
				-- For generic cheatsheets like default, unicode, nerd-fonts, etc
				bundled_cheatsheets = {
					disabled = { "nerd-fonts", "unicode" },
				},
				bundled_plugin_cheatsheets = true,
				-- For bundled plugin cheatsheets, do not show a sheet if you
				-- don't have the plugin installed (searches runtimepath for
				-- same directory name)
				include_only_installed_plugins = true,
				-- Key mappings bound inside the telescope window
				telescope_mappings = {
					["<CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
					["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
					["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
					["<C-E>"] = require("cheatsheet.telescope.actions").edit_user_cheatsheet,
				},
			})
		end,
	},
	-- [https://github.com/VonHeikemen/searchbox.nvim]
	{
		"VonHeikemen/searchbox.nvim",
		branch = "main",
		requires = { "MunifTanjim/nui.nvim" },
		config = function()
			require("searchbox").setup({
				popup = {
					enter = true,
					focusable = true,
					relative = "win",
					position = {
						row = "5%",
						col = "95%",
					},
					size = 30,
					border = {
						style = "rounded",
						text = {
							top = " Search ",
							top_align = "left",
						},
					},
					buf_options = {
						modifiable = true,
						readonly = false,
					},
				},
			})
		end,
	},
	-- [https://github.com/vuki656/package-info.nvim]
	{
		"vuki656/package-info.nvim",
		branch = "master",
		requires = { "MunifTanjim/nui.nvim" },
		config = function()
			require("package-info").setup()
		end,
	},
	-- [https://github.com/lukas-reineke/indent-blankline.nvim]
	-- context_char_list = "'│', '|', '¦', '┆', '┊', '┃'",
	{
		"lukas-reineke/indent-blankline.nvim",
		branch = "master",
		requires = { { "nvim-treesitter/nvim-treesitter" }, { "EdenEast/nightfox.nvim" } },
		event = { "BufRead", "BufReadPost" },
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indentLine_char = "┆"
			vim.g.indentLine_context_char = "┆"
			vim.g.indent_blankline_space_char_blankline = " "
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = true
			vim.g.indent_blankline_show_first_indent_level = false
			vim.g.indent_blankline_use_treesitter = true
			vim.g.indent_blankline_show_foldtext = true
			vim.g.indent_blankline_show_current_context = true
			vim.g.indent_blankline_show_current_context_start = true
			vim.g.indent_blankline_show_current_context_start_on_current_line = true
			vim.g.indent_blankline_viewport_buffer = 200
			vim.g.indent_blankline_indent_level = 20
		end,
	},
	-- [https://github.com/tpope/vim-sleuth]
	-- basic support for .env and Procfile  [https://github.com/tpope/vim-dotenv]
	{
		"tpope/vim-dotenv",
		branch = "master",
		requires = { "nvim-treesitter/nvim-treesitter" },
	},
	-- mappings for bracket chars "[" "]" [https://github.com/tpope/vim-unimpaired]
	{
		"tpope/vim-unimpaired",
		branch = "master",
		requires = { "nvim-treesitter/nvim-treesitter" },
	},
	-- mappings to delete, change and add surroundings  [https://github.com/tpope/vim-surround]
	{
		"tpope/vim-surround",
		branch = "master",
		requires = { { "nvim-treesitter/nvim-treesitter" } },
		-- event = { "BufRead", "BufReadPost" },
		config = function()
			vim.g.surround_use_pairs = 1
		end,
	},
	-- Provides key mapping to add/replace/delete/cycle surrounding characters.  [https://github.com/blackCauldron7/surround.nvim]
	{
		"blackCauldron7/surround.nvim",
		branch = "master",
		requires = { { "nvim-treesitter/nvim-treesitter" } },
		-- event = { "BufRead", "BufReadPost" },
		config = function()
			require("surround").setup({
				context_offset = 100,
				load_autogroups = false,
				mappings_style = "surround",
				map_insert_mode = true,
				quotes = { "'", '"', "`" },
				brackets = { "(", "{", "[" },
				space_on_closing_char = false,
				pairs = {
					nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
					linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
				},
				prefix = "S",
			})
		end,
	},
	-- Press <C-G>c in insert mode to toggle a temporary software caps lock, or gC in normal mode
	-- to toggle a slightly more permanent one.  [https://github.com/tpope/vim-capslock]
	{
		"tpope/vim-capslock",
		branch = "master",
	},
	-- [https://github.com/alvan/vim-closetag]
	{
		"alvan/vim-closetag",
		branch = "master",
		requires = { { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
		event = { "BufRead", "BufReadPost" },
	},
	-- Ranger file explorer plugin  [https://github.com/kevinhwang91/rnvimr]
	{
		"kevinhwang91/rnvimr",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			vim.g.rnvimr_pick_enable = 1
			vim.g.rnvimr_bw_enable = 1
			vim.g.rnvimr_enable_ex = 1
			vim.g.rnvimr_edit_cmd = "drop"
			vim.g.rnvimr_hide_gitignore = 1
			vim.g.rnvimr_enable_bw = 1
			vim.g.rnvimr_ranger_cmd = 'ranger --cmd "set preview_images=1 set draw_borders both"'
		end,
	},
	-- Moving and duplicating blocks and lines  [https://github.com/booperlv/nvim-gomove]
	{
		"booperlv/nvim-gomove",
		branch = "main",
		config = function()
			require("gomove").setup({
				-- whether or not to map default key bindings, (true/false)
				map_defaults = true,
				-- what method to use for reindenting, ("vim-move" / "simple" / ("none"/nil))
				reindent_mode = "vim-move",
				-- whether to not to move past line when moving blocks horizontally, (true/false)
				move_past_line = false,
				-- whether or not to ignore indent when duplicating lines horizontally, (true/false)
				ignore_indent_lh_dup = true,
			})
		end,
	},
	-- Multiple cursors like VSCode  [https://github.com/mg979/vim-visual-multi]
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	-- Select/yank multiple lines that are not adjacent  [https://github.com/Rasukarusan/nvim-select-multi-line]
	{
		"Rasukarusan/nvim-select-multi-line",
		branch = "master",
	},
	-- Smooth scrolling  [https://github.com/karb94/neoscroll.nvim]
	{
		"karb94/neoscroll.nvim",
		branch = "master",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = {
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	-- Minimap Plugin  [https://github.com/severin-lemaignan/vim-minimap.vim]
	{
		"severin-lemaignan/vim-minimap",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		run = "cargo install --locked code-minimap",
		cmd = {
			"Minimap",
			"MinimapClose",
			"MinimapToggle",
			"MinimapRefresh",
			"MinimapUpdateHighlight",
		},
		config = function()
			vim.g.minimap_width = 10
			vim.g.minimap_auto_start = 1
			vim.g.minimap_auto_start_win_enter = 1
		end,
	},
	-- generate a proper documentation skeleton based on certain expressions (mainly functions)
	-- [https://github.com/kkoomen/vim-doge]
	{
		"kkoomen/vim-doge",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		event = { "CursorHold", "BufRead", "BufReadPost" },
		run = ":call doge#install()",
	},
	-- [https://github.com/tpope/vim-commentary]
	{
		"tpope/vim-commentary",
		branch = "master",
		requires = { { "neovim/nvim-lspconfig" }, { "nvim-treesitter/nvim-treesitter" } },
	},
	-- [https://github.com/RRethy/vim-illuminate]
	{
		"RRethy/vim-illuminate",
		branch = "master",
	},
	-- [https://github.com/weilbith/nvim-code-action-menu]
	{
		"weilbith/nvim-code-action-menu",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		event = { "CursorHold", "BufRead", "BufReadPost" },
		cmd = "CodeActionMenu",
	},
	-- [https://github.com/kosayoda/nvim-lightbulb]
	-- Peeking the buffer while entering command :{number}  https://github.com/nacro90/numb.nvim
	{
		"nacro90/numb.nvim",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		-- event = { "BufRead", "BufReadPost" },
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	},
	-- [https://github.com/junegunn/fzf.vim]
	{
		"junegunn/fzf.vim",
		branch = "master",
		requires = {
			{ "junegunn/fzf" },
		},
	},
	-- Use FZF to display results and navigate the code  [https://github.com/ojroques/nvim-lspfuzzy]
	{
		"ojroques/nvim-lspfuzzy",
		branch = "main",
		requires = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim", opt = true }, -- to enable preview (optional)
			{ "EdenEast/nightfox.nvim" },
		},
		config = function()
			require("lspfuzzy").setup({
				methods = "all", -- either 'all' or a list of LSP methods (see below)
				jump_one = true, -- jump immediately if there is only one location
				callback = nil, -- callback called after jumping to a location
				save_last = false, -- save last location results for the :LspFuzzyLast command
				fzf_preview = {
					-- arguments to the FZF '--preview-window' option
					"right:+{2}-/2", -- preview on the right and centered on entry
				},
				fzf_action = {
					-- FZF actions
					["ctrl-t"] = "tab split", -- go to location in a new tab
					["ctrl-v"] = "vsplit", -- go to location in a vertical split
					["ctrl-x"] = "split", -- go to location in a horizontal split
				},
				fzf_modifier = ":~:.", -- format FZF entries, see |filename-modifiers|
				fzf_trim = true, -- trim FZF entries
			})
		end,
	},
	-- better quickfix window  https://github.com/kevinhwang91/nvim-bqf
	{
		"kevinhwang91/nvim-bqf",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		event = { "BufRead", "BufReadPost", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	-- previewing native LSP's goto definition calls in floating windows  [https://github.com/rmagatti/goto-preview]
	{
		"rmagatti/goto-preview",
		branch = "main",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		-- event = { "BufRead", "BufReadPost" },
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
			})
			-- You can use "default_mappings = true" setup option
			-- Or explicitly set keybindings
		end,
	},
	-- cwd to the project's root directory  [https://github.com/ahmedkhalf/lsp-rooter.nvim]
	{
		"ahmedkhalf/lsp-rooter.nvim",
		branch = "main",
		event = "BufRead",
		config = function()
			require("lsp-rooter").setup()
		end,
	},
	-- Hint when you type  [https://github.com/ray-x/lsp_signature.nvim]
	{
		"ray-x/lsp_signature.nvim",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		event = { "CursorHold", "BufRead", "BufReadPost" },
		config = function()
			require("lsp_signature").setup()
		end,
	},
	-- A tree like view for symbols [https://github.com/simrat39/symbols-outline.nvim]
	{
		"simrat39/symbols-outline.nvim",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		cmd = "SymbolsOutline",
	},
	-- Preview markdown in the browser  [https://github.com/iamcco/markdown-preview.nvim]
	{
		"iamcco/markdown-preview.nvim",
		branch = "master",
		run = "cd app && npm install",
		ft = "markdown",
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
		config = function()
			vim.g.mkdp_auto_start = 0
		end,
	},
	-- Simple session management  [https://github.com/folke/persistence.nvim]
	-- Rust file detection, syntax highlighting, formatting, Syntastic integration, and more.  [https://github.com/rust-lang/rust.vim]
	{
		"rust-lang/rust.vim",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "EdenEast/nightfox.nvim" },
		},
		ft = { "rust" },
	},
	-- [https://github.com/simrat39/rust-tools.nvim]
	{
		"simrat39/rust-tools.nvim",
		branch = "master",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "mfussenegger/nvim-dap" },
		},
		config = function()
			require("rust-tools").setup({
				tools = {
					autoSetHints = true,
					hover_with_actions = true,
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					cmd = {
						vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer",
					},
					on_attach = require("lvim.lsp").common_on_attach,
					on_init = require("lvim.lsp").common_on_init,
				},
			})
		end,
		ft = { "rust", "rs" },
		cmd = {
			"RustSetInlayHints",
			"RustDisableInlayHints",
			"RustToggleInlayHints",
			"RustRunnables",
			"RustExpandMacro",
			"RustOpenCargo",
			"RustParentModule",
			"RustJoinLines",
			"RustHoverActions",
			"RustHoverRange",
			"RustSSR",
			"RustMoveItemDown",
			"RustMoveItemUp",
			"RustStartStandaloneServerForBuffer",
			"RustDebuggables",
			"RustViewCrateGraph",
			"RustReloadWorkspace",
		},
	},
	-- Build flutter and dart applications in neovim using the native LSP
	-- [https://github.com/akinsho/flutter-tools.nvim]
	{
		"akinsho/flutter-tools.nvim",
		branch = "main",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "mfussenegger/nvim-dap" },
			{ "EdenEast/nightfox.nvim" },
		},
		ft = { "dart" },
		cmd = {
			"FlutterRun",
			"FlutterDevices",
			"FlutterEmulators",
			"FlutterReload",
			"FlutterRestart",
			"FlutterQuit",
			"FlutterDetach",
			"FlutterOutlineToggle",
			"FlutterOutlineOpen",
			"FlutterDevTools",
			"FlutterCopyProfilerUrl",
			"FlutterLspRestart",
		},
		config = function()
			require("flutter-tools").setup({}) -- use defaults
			require("telescope").load_extension("flutter") -- Telescope integration
		end,
	},
	-- Intelligently reopen files at your last edit position  [https://github.com/ethanholz/nvim-lastplace]
	{
		"ethanholz/nvim-lastplace",
		branch = "main",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	-- interactive vertical scrollbars  [https://github.com/dstein64/nvim-scrollview]
	--[[ see :help scrollview-configuration
        :ScrollViewDisable command disables scrollbars
        :ScrollViewEnable command enables scrollbars
        :ScrollViewRefresh command refreshes the scrollbar
    ]]
	{
		"dstein64/nvim-scrollview",
		branch = "main",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
}

--[[ Formatting ]]
--
-- To appropriately highlight codefences returned from denols
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

-- [https://www.lunarvim.org/languages/#server-setup]
-- Add the server you wish to configure manually to lvim.lsp.override
vim.list_extend(lvim.lsp.override, { "tsserver", "tailwindcss", "jsonls" })
--- list of options that should take predence over any of LunarVim's defaults
--- check the lspconfig documentation for a list of all possible options
local tsopts = {
	-- Needed for inlayHints. Merge this table with your settings or copy
	-- it from the source if you want to add your own init_options.
	init_options = require("nvim-lsp-ts-utils").init_options,
	filetypes = {
		-- "astro",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	on_attach = function(client, bufnr)
		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,
			-- import all
			import_all_timeout = 2000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,
			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},
			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = "Comment",
			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = true,
			watch_dir = nil,
		})

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local options = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gmo", ":TSLspOrganize<CR>", options)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gmr", ":TSLspRenameFile<CR>", options)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gma", ":TSLspImportAll<CR>", options)
	end,
}
require("lvim.lsp.manager").setup("tsserver", tsopts)

local json_opts = {
	colorDecorators = {
		enable = true,
	},
	format = {
		enable = true,
	},
	filetypes = {
		"json",
		"jsonc",
	},
}
require("lvim.lsp.manager").setup("jsonls", json_opts)

local tw_opts = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	-- cmd = {
	-- "/home/thacken/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server",
	-- "--stdio",
	-- },
	-- filetypes copied and adjusted from tailwindcss-intellisense
	filetypes = {
		-- html
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"django-html",
		"edge",
		"eelixir", -- vim ft
		"ejs",
		"erb",
		"eruby", -- vim ft
		"gohtml",
		"haml",
		"handlebars",
		"hbs",
		"html",
		-- 'HTML (Eex)',
		-- 'HTML (EEx)',
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		-- js
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
	},
	init_options = {
		userLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
		},
	},
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"classList",
				"ngClass",
			},
		},
	},
	on_new_config = function(new_config)
		if not new_config.settings then
			new_config.settings = {}
		end
		if not new_config.settings.editor then
			new_config.settings.editor = {}
		end
		if not new_config.settings.editor.tabSize then
			-- set tab size for hover
			new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
		end
	end,
	root_dir = function(fname)
		local util = require("lspconfig/util")
		return util.root_pattern("tailwind.config.js", "tailwind.config.ts")(fname)
			or util.root_pattern("postcss.config.js", "postcss.config.ts")(fname)
			or util.find_package_json_ancestor(fname)
			or util.find_node_modules_ancestor(fname)
			or util.find_git_ancestor(fname)
	end,
	docs = {
		description = [[
https://github.com/tailwindlabs/tailwindcss-intellisense

Tailwind CSS Language Server can be installed via npm:
```sh
npm install -g @tailwindcss/language-server
```
]],
		default_config = {
			root_dir = [[root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git')]],
		},
	},
}
require("lvim.lsp.manager").setup("tailwindcss", tw_opts)

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = {
			cmd = { "ls_emmet", "--stdio" },
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"astro",
				"haml",
				"xml",
				"xsl",
				"pug",
				"slim",
				"sass",
				"stylus",
				"less",
				"sss",
				"hbs",
				"handlebars",
			},
			root_dir = function(fname)
				local util = require("lspconfig/util")
				return util.root_pattern("tailwind.config.js", "tailwind.config.ts")(fname)
					or util.root_pattern("postcss.config.js", "postcss.config.ts")(fname)
					or util.find_package_json_ancestor(fname)
					or util.find_node_modules_ancestor(fname)
					or util.find_git_ancestor(fname)
			end,
			-- root_dir = function(fname)
			--   return vim.loop.cwd()
			-- end;
			settings = {},
		},
	}
end
lspconfig.ls_emmet.setup({ capabilities = capabilities })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", args = { "--line-length=80", "--fast" } },
	-- {exe = "isort"},
	{ exe = "gofmt" },
	{ exe = "shfmt" },
	{
		exe = "stylua",
		-- args = {
		--   -- '--config-path="/home/thacken/.config/lvim/stylua.toml"',
		--   '--column-width="100"',
		--   '--line-endings="Unix"',
		--   '--indent-type="Tabs"',
		--   '--indent-width="4"',
		--   '--quote-style="AutoPreferSingle"'
		-- }
	},
	{
		exe = "lua-format",
		args = {
			"--no-keep-simple-function-one-line",
			"--no-break-after-operator",
			"--column-limit=100",
			"--break-after-table-lb",
			"--indent-width=4",
		},
	},
	{ exe = "rustfmt" },
	{ exe = "dart-format" },
	{
		exe = "prettier_d_slim",
		args = {
			"--config-precedence=prefer-file",
		},
	},
	{
		exe = "eslint_d",
		args = {
			-- "--config=/home/thacken/.config/.eslintrc",
			"--resolve-plugins-relative-to=/home/thacken/.nvm/versions/node/v16.7.0/lib/node_modules",
			"--fix",
			"--stdin",
			-- "--fix-to-stdout",
			"--parser=@typescript-eslint/parser",
			'--parser-options={"project":"tsconfig.json"}',
			"--ignore-path=/home/thacken/.config/.eslintignore",
			"--cache",
			"--cache-location=/home/thacken/.config/.eslintcache",
		},
	},
	-- {
	--     exe = "rustywind",
	--     args = {"--write", "."}
	-- },
})
-- "--rule={'eol-last': ['error', 'never']}",

--[[ Linting ]]
--
--[[
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		exe = "eslint_d",
		args = {
			-- "--config=/home/thacken/.config/.eslintrc",
			"--resolve-plugins-relative-to=/home/thacken/.nvm/versions/node/v16.7.0/lib/node_modules",
			"--parser=@typescript-eslint/parser",
			'--parser-options={"project":"tsconfig.json"}',
			"--fix",
			"--ignore-path=/home/thacken/.config/.eslintignore",
			"--cache",
			"--cache-location=/home/thacken/.config/.eslintcache",
		},
	},
})

-- eslint_d
-- Autofix visual selection with eslint_d:
lvim.builtin.which_key.vmappings["E"] = {
	":!eslint_d --stdin --fix-to-stdout<CR>gv",
	"Format (eslint_d)",
}
-- Autofix entire buffer with eslint_d:
lvim.builtin.which_key.mappings["E"] = {
	"mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F",
	"Format (eslint_d)",
}

-- Chakra Theme  [/home/thacken/.config/lvim/lua/config]
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- { "BufWinEnter", "*", ":filetype plugin indent on | :set nocompatible" },
-- { "BufWinEnter", "*.ts,*.tsx,*.js,*.jsx", ":!eslint_d restart --cache --cache-location=/home/thacken/.config/.eslintcache" },
lvim.autocommands.custom_groups = {
	{ "BufWinEnter", "*", ":highlight GitSignsAdd guifg='#58cdff'" }, -- GitSignsAddNr guifg=cyan
	{ "BufWinEnter", "*", ":highlight GitSignsChange guifg='#c4b5fd'" }, -- GitSignsChangeNr guifg=orange
	{ "BufWinEnter", "*", ":highlight GitSignsDelete guifg='#20e3b2'" }, -- GitSignsDeleteNr guifg=pink
	{ "BufWinEnter", "*", ":highlight ScrollView guibg='#bdc5e9'" },
	{ "BufWinEnter", "*", ":hi default link RenamerNormal Normal" },
	{ "BufWinEnter", "*", ":hi default link RenamerBorder RenamerNormal" },
	{ "BufWinEnter", "*", ":hi default link RenamerTitle Identifier" },
	{ "BufWinEnter", "*", ":filetype plugin indent on" },
	{ "BufWinEnter", "*", ":set nocompatible" },
	{
		"BufWinEnter",
		"*.fish,*.sh,*.zsh,*.vim,*.vimrc,*.toml,*.yml,*.yaml,*.conf,*.config",
		":setlocal ts=4 sw=4",
	},
	{ "InsertEnter", "*", ":normal zz" }, -- scroll the window so the cursor line is centered
	{ "FileType", "*.astro", ":setlocal syntax=typescriptreact ts=2 sw=2" },
}
