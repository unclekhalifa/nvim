local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    mru = { limit = 3 },
    project = { enable = true, limit = 3, label = 'Projects', action = 'Telescope find_files cwd=' },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'PackerSync', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      -- {
      --   desc = ' Apps',
      --   group = 'DiagnosticHint',
      --   action = 'Telescope app',
      --   key = 'a',
      -- },
      -- {
      --   desc = ' dotfiles',
      --   group = 'Number',
      --   action = 'Telescope dotfiles',
      --   key = 'd',
      -- },
    },
  },
})
