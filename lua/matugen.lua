 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1d23',
    base01 = '#2b313b',
    base02 = '#262c36',
    base03 = '#626871',
    base04 = '#afb2b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#a178ba',
    base0A = '#8178ba',
    base0B = '#899fc3',
    base0C = '#c4abd4',
    base0D = '#aabad4',
    base0E = '#b0abd4',
    base0F = '#741d2b',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopeBorder',         { fg = '#626871',             bg = '#1a1d23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopePromptBorder',   { fg = '#626871',             bg = '#1a1d23' })
  hi('TelescopePromptPrefix',   { fg = '#899fc3',             bg = '#1a1d23' })
  hi('TelescopePromptCounter',  { fg = '#afb2b6',  bg = '#1a1d23' })
  hi('TelescopePromptTitle',    { fg = '#1a1d23',             bg = '#899fc3' })
  hi('TelescopePreviewTitle',   { fg = '#1a1d23',             bg = '#8178ba' })
  hi('TelescopeResultsTitle',   { fg = '#1a1d23',             bg = '#a178ba' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262c36' })
  hi('TelescopeSelectionCaret', { fg = '#899fc3',             bg = '#262c36' })
  hi('TelescopeMatching',       { fg = '#899fc3',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
