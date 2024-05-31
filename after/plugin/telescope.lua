local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("telescope not found!")
  return
end

telescope.setup({
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      grouped = true,
      hidden = true,
      initial_mode = "normal",
      path = "%:p:h select_buffer=true", -- Open telescope in the directory we're in
    }
  }
})

require("telescope").load_extension("env") -- Find env variables set across the system
require("telescope").load_extension("file_browser") -- Browse files, obviously
require("telescope").load_extension("fzf") -- Fuzzy finder
require("telescope").load_extension("live_grep_args") -- Grep across system
require("telescope").load_extension("project") -- Grep specific project
require("telescope").load_extension("projects") -- Grep projects
require("telescope").load_extension("repo") -- Search repo
