-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kas/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/kas/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/kas/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/kas/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kas/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2€\3\0\0\6\0\20\0'4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\t\0003\2\a\0003\3\3\0003\4\4\0003\5\5\0:\5\6\4;\4\3\3:\3\b\2:\2\n\0013\2\v\0002\3\0\0:\3\f\0022\3\0\0:\3\b\0022\3\3\0004\4\0\0%\5\r\0>\4\2\0027\4\14\4;\4\1\3:\3\15\0022\3\3\0004\4\0\0%\5\r\0>\4\2\0027\4\16\4;\4\1\3:\3\17\0022\3\0\0:\3\18\0022\3\0\0:\3\19\2:\2\r\1>\0\2\1G\0\1\0\14lualine_z\14lualine_y\14lualine_x\17tabline_tabs\14lualine_c\20tabline_buffers\ftabline\14lualine_a\1\0\0\rsections\1\0\0\14lualine_b\1\0\0\fsymbols\1\0\4\tinfo\tïš \thint\tï™ \twarn\tï± \nerror\tï— \1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nord.nvim"] = {
    config = { "\27LJ\1\2^\0\0\2\0\6\0\n4\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0>\0\1\1G\0\1\0\bset\tnord\frequire\28nord_disable_background\6g\bvim\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2R\0\1\2\1\2\0\f+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\21select_next_item\fvisibleR\0\1\2\1\2\0\f+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\21select_prev_item\fvisibleò\5\1\0\t\0-\0V4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0003\3\27\0003\4\6\0007\5\4\0007\5\5\5>\5\1\2:\5\a\0047\5\4\0007\5\b\5>\5\1\2:\5\t\0047\5\4\0007\5\n\5'\6üÿ>\5\2\2:\5\v\0047\5\4\0007\5\n\5'\6\4\0>\5\2\2:\5\f\0047\5\4\0007\5\r\5>\5\1\2:\5\14\0047\5\4\0007\5\15\5>\5\1\2:\5\16\0047\5\4\0007\5\17\0053\6\20\0007\a\18\0007\a\19\a:\a\21\6>\5\2\2:\5\22\0041\5\23\0:\5\24\0041\5\25\0:\5\26\4:\4\4\0033\4\29\0003\5\28\0:\5\30\0047\5\31\0013\6 \0>\5\2\2:\5!\4:\4\"\0037\4#\0007\4$\0042\5\3\0003\6%\0;\6\1\0053\6&\0;\6\2\0052\6\3\0003\a'\0;\a\1\6>\4\3\2:\4$\3>\2\2\0017\2\3\0007\2(\2%\3)\0003\4,\0007\5#\0007\5$\0052\6\3\0003\a*\0;\a\1\0062\a\3\0003\b+\0;\b\1\a>\5\3\2:\5$\4>\2\3\0010\0\0€G\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\fsources\vconfig\15formatting\vformat\1\0\2\rmaxwidth\0032\14with_text\1\15cmp_format\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\1\0\0\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\nsetup\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-smag"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/nvim-lsp-smag",
    url = "https://github.com/weilbith/nvim-lsp-smag"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2A\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimœ\a\1\2\n\0\31\0P1\2\0\0001\3\1\0\16\4\3\0%\5\2\0%\6\3\0>\4\3\0013\4\4\0\16\5\2\0%\6\5\0%\a\6\0%\b\a\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\b\0%\b\t\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\n\0%\b\v\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\f\0%\b\r\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\14\0%\b\15\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\16\0%\b\17\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\18\0%\b\19\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\20\0%\b\21\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\22\0%\b\23\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\24\0%\b\25\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\26\0%\b\27\0\16\t\4\0>\5\5\0014\5\28\0%\6\29\0>\5\2\0027\5\30\5>\5\1\0010\0\0€G\0\1\0\14on_attach\18lsp_signature\frequire*<cmd>lua vim.lsp.buf.formatting()<CR>\14<Leader>f\27<cmd>TroubleToggle<CR>\14<Leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<Leader>e+<cmd>lua vim.lsp.buf.code_action()<CR>\15<Leader>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<Leader>R%<Cmd>lua vim.lsp.buf.hover()<CR>\6K$<cmd>Trouble lsp_references<CR>\14<Leader>r*<Cmd>lua vim.lsp.buf.definition()<CR>\14<Leader>d+<Cmd>lua vim.lsp.buf.declaration()<CR>\14<Leader>D\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0ª\a\1\0\16\0.\0b4\0\0\0%\1\1\0>\0\2\0023\1\2\0004\2\3\0\16\3\1\0>\2\2\4D\5\f€%\a\4\0\16\b\5\0$\a\b\a4\b\5\0007\b\6\b7\b\a\b\16\t\a\0003\n\b\0:\6\t\n:\a\n\n:\a\v\n>\b\3\1B\5\3\3N\5ò4\2\5\0007\2\f\0027\2\r\0023\3\15\0003\4\14\0:\4\16\3>\2\2\0014\2\5\0007\2\17\0027\2\18\0024\3\5\0007\3\17\0037\3\20\0034\4\5\0007\4\17\0047\4\18\0047\4\21\0043\5\22\0>\3\3\2:\3\19\0024\2\5\0007\2\17\0027\2\18\0024\3\5\0007\3\17\0037\3\20\0034\4\5\0007\4\17\0047\4\18\0047\4\24\0043\5\25\0>\3\3\2:\3\23\0021\2\26\0004\3\5\0007\3\17\0037\3\27\0037\3\28\3>\3\1\0024\4\0\0%\5\29\0>\4\2\0027\4\30\4\16\5\3\0>\4\2\2\16\3\4\0003\4\31\0004\5 \0\16\6\4\0>\5\2\4T\b\22€3\n!\0:\2\"\n:\3#\n3\v$\0:\v%\n4\v&\0\a\v'\0T\v\n€3\v)\0003\f(\0:\f*\v4\f\5\0007\f+\f%\r,\0\16\14\v\0\16\15\n\0>\f\4\2\16\n\f\0006\v\t\0007\v-\v\16\f\n\0>\v\2\1A\b\3\3N\bèG\0\1\0\nsetup\nforce\20tbl_deep_extend\bcmd\1\0\0\1\4\0\0\vclangd\23--background-index\29--header-insertion=never\vclangd\vserver\nflags\1\0\1\26debounce_text_changes\3–\1\17capabilities\14on_attach\1\0\0\vipairs\1\2\0\0\vclangd\24update_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\0\1\0\1\vborder\frounded\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\nfloat\1\0\0\1\0\1\vborder\frounded\vconfig\15diagnostic\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\tInfo\tïš \tHint\tï™ \nError\tï— \tWarn\tï± \14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2¨\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\2\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["tabline.nvim"] = {
    config = { "\27LJ\1\2D\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\venable\1\nsetup\ftabline\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/tabline.nvim",
    url = "https://github.com/kdheepak/tabline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2€\2\0\0\5\0\r\0\0184\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0>\1\2\0017\1\4\0003\2\b\0003\3\6\0003\4\5\0:\4\a\3:\3\t\0023\3\v\0003\4\n\0:\4\3\3:\3\f\2>\1\2\1G\0\1\0\15extensions\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\fpickers\1\0\0\14live_grep\1\0\0\1\0\1\ntheme\rdropdown\nsetup\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2R\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\25use_diagnostic_signs\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-better-whitespace"] = {
    config = { '\27LJ\1\2?\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\2\0:\1\2\0G\0\1\0"show_spaces_that_precede_tabs\6g\bvim\0' },
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["zoomwintab.vim"] = {
    loaded = true,
    path = "/home/kas/.local/share/nvim/site/pack/packer/start/zoomwintab.vim",
    url = "https://github.com/troydm/zoomwintab.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2A\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimœ\a\1\2\n\0\31\0P1\2\0\0001\3\1\0\16\4\3\0%\5\2\0%\6\3\0>\4\3\0013\4\4\0\16\5\2\0%\6\5\0%\a\6\0%\b\a\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\b\0%\b\t\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\n\0%\b\v\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\f\0%\b\r\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\14\0%\b\15\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\16\0%\b\17\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\18\0%\b\19\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\20\0%\b\21\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\22\0%\b\23\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\24\0%\b\25\0\16\t\4\0>\5\5\1\16\5\2\0%\6\5\0%\a\26\0%\b\27\0\16\t\4\0>\5\5\0014\5\28\0%\6\29\0>\5\2\0027\5\30\5>\5\1\0010\0\0€G\0\1\0\14on_attach\18lsp_signature\frequire*<cmd>lua vim.lsp.buf.formatting()<CR>\14<Leader>f\27<cmd>TroubleToggle<CR>\14<Leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<Leader>e+<cmd>lua vim.lsp.buf.code_action()<CR>\15<Leader>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<Leader>R%<Cmd>lua vim.lsp.buf.hover()<CR>\6K$<cmd>Trouble lsp_references<CR>\14<Leader>r*<Cmd>lua vim.lsp.buf.definition()<CR>\14<Leader>d+<Cmd>lua vim.lsp.buf.declaration()<CR>\14<Leader>D\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0ª\a\1\0\16\0.\0b4\0\0\0%\1\1\0>\0\2\0023\1\2\0004\2\3\0\16\3\1\0>\2\2\4D\5\f€%\a\4\0\16\b\5\0$\a\b\a4\b\5\0007\b\6\b7\b\a\b\16\t\a\0003\n\b\0:\6\t\n:\a\n\n:\a\v\n>\b\3\1B\5\3\3N\5ò4\2\5\0007\2\f\0027\2\r\0023\3\15\0003\4\14\0:\4\16\3>\2\2\0014\2\5\0007\2\17\0027\2\18\0024\3\5\0007\3\17\0037\3\20\0034\4\5\0007\4\17\0047\4\18\0047\4\21\0043\5\22\0>\3\3\2:\3\19\0024\2\5\0007\2\17\0027\2\18\0024\3\5\0007\3\17\0037\3\20\0034\4\5\0007\4\17\0047\4\18\0047\4\24\0043\5\25\0>\3\3\2:\3\23\0021\2\26\0004\3\5\0007\3\17\0037\3\27\0037\3\28\3>\3\1\0024\4\0\0%\5\29\0>\4\2\0027\4\30\4\16\5\3\0>\4\2\2\16\3\4\0003\4\31\0004\5 \0\16\6\4\0>\5\2\4T\b\22€3\n!\0:\2\"\n:\3#\n3\v$\0:\v%\n4\v&\0\a\v'\0T\v\n€3\v)\0003\f(\0:\f*\v4\f\5\0007\f+\f%\r,\0\16\14\v\0\16\15\n\0>\f\4\2\16\n\f\0006\v\t\0007\v-\v\16\f\n\0>\v\2\1A\b\3\3N\bèG\0\1\0\nsetup\nforce\20tbl_deep_extend\bcmd\1\0\0\1\4\0\0\vclangd\23--background-index\29--header-insertion=never\vclangd\vserver\nflags\1\0\1\26debounce_text_changes\3–\1\17capabilities\14on_attach\1\0\0\vipairs\1\2\0\0\vclangd\24update_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\0\1\0\1\vborder\frounded\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\nfloat\1\0\0\1\0\1\vborder\frounded\vconfig\15diagnostic\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\tInfo\tïš \tHint\tï™ \nError\tï— \tWarn\tï± \14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
try_loadstring("\27LJ\1\2D\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\venable\1\nsetup\ftabline\frequire\0", "config", "tabline.nvim")
time([[Config for tabline.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\6\0\n4\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0>\0\1\1G\0\1\0\bset\tnord\frequire\28nord_disable_background\6g\bvim\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring('\27LJ\1\2?\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\2\0:\1\2\0G\0\1\0"show_spaces_that_precede_tabs\6g\bvim\0', "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\2R\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\25use_diagnostic_signs\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2€\3\0\0\6\0\20\0'4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\t\0003\2\a\0003\3\3\0003\4\4\0003\5\5\0:\5\6\4;\4\3\3:\3\b\2:\2\n\0013\2\v\0002\3\0\0:\3\f\0022\3\0\0:\3\b\0022\3\3\0004\4\0\0%\5\r\0>\4\2\0027\4\14\4;\4\1\3:\3\15\0022\3\3\0004\4\0\0%\5\r\0>\4\2\0027\4\16\4;\4\1\3:\3\17\0022\3\0\0:\3\18\0022\3\0\0:\3\19\2:\2\r\1>\0\2\1G\0\1\0\14lualine_z\14lualine_y\14lualine_x\17tabline_tabs\14lualine_c\20tabline_buffers\ftabline\14lualine_a\1\0\0\rsections\1\0\0\14lualine_b\1\0\0\fsymbols\1\0\4\tinfo\tïš \thint\tï™ \twarn\tï± \nerror\tï— \1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2¨\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\2\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2R\0\1\2\1\2\0\f+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\21select_next_item\fvisibleR\0\1\2\1\2\0\f+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\21select_prev_item\fvisibleò\5\1\0\t\0-\0V4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0003\3\27\0003\4\6\0007\5\4\0007\5\5\5>\5\1\2:\5\a\0047\5\4\0007\5\b\5>\5\1\2:\5\t\0047\5\4\0007\5\n\5'\6üÿ>\5\2\2:\5\v\0047\5\4\0007\5\n\5'\6\4\0>\5\2\2:\5\f\0047\5\4\0007\5\r\5>\5\1\2:\5\14\0047\5\4\0007\5\15\5>\5\1\2:\5\16\0047\5\4\0007\5\17\0053\6\20\0007\a\18\0007\a\19\a:\a\21\6>\5\2\2:\5\22\0041\5\23\0:\5\24\0041\5\25\0:\5\26\4:\4\4\0033\4\29\0003\5\28\0:\5\30\0047\5\31\0013\6 \0>\5\2\2:\5!\4:\4\"\0037\4#\0007\4$\0042\5\3\0003\6%\0;\6\1\0053\6&\0;\6\2\0052\6\3\0003\a'\0;\a\1\6>\4\3\2:\4$\3>\2\2\0017\2\3\0007\2(\2%\3)\0003\4,\0007\5#\0007\5$\0052\6\3\0003\a*\0;\a\1\0062\a\3\0003\b+\0;\b\1\a>\5\3\2:\5$\4>\2\3\0010\0\0€G\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\fsources\vconfig\15formatting\vformat\1\0\2\rmaxwidth\0032\14with_text\1\15cmp_format\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\1\0\0\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\nsetup\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2€\2\0\0\5\0\r\0\0184\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0>\1\2\0017\1\4\0003\2\b\0003\3\6\0003\4\5\0:\4\a\3:\3\t\0023\3\v\0003\4\n\0:\4\3\3:\3\f\2>\1\2\1G\0\1\0\15extensions\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\fpickers\1\0\0\14live_grep\1\0\0\1\0\1\ntheme\rdropdown\nsetup\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
