local status_ok, diff_view = pcall(require, "diffview")
if not status_ok then
  print("diffview not found!")
end

diff_view.setup({
  file_panel = {
    listing_style = "list", -- One of 'list' or 'tree'
  },
})
