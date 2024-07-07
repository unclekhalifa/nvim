local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  print('lualine plugin not found!')
  return
end

lualine.setup({
  options = {
    theme = 'auto',
    disabled_filetypes = {
      winbar = {}
    }
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {
      'datetime',
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'windows'},
    lualine_z = {'tabs'}
  }
})
