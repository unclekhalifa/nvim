local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

local options = {
  mode = "n",     -- Normal mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local keymaps = {
  { "<leader>C",  "<Cmd>%bd|e#|bd#<CR>",                                                        desc = "Close Others",         nowait = false, remap = false },
  { "<leader>F",  "<Cmd>lua vim.lsp.buf.format()<CR>",                                          desc = "format",               nowait = false, remap = false },
  { "<leader>P",  group = "Plugins",                                                            nowait = false,                remap = false },
  { "<leader>PS", "<Cmd>PackerStatus<CR>",                                                      desc = "status",               nowait = false, remap = false },
  { "<leader>Pc", "<Cmd>PackerCompile<CR>",                                                     desc = "compile",              nowait = false, remap = false },
  { "<leader>Pi", "<Cmd>PackerInstall<CR>",                                                     desc = "install",              nowait = false, remap = false },
  { "<leader>Ps", "<Cmd>PackerSync<CR>",                                                        desc = "sync",                 nowait = false, remap = false },
  { "<leader>Pu", "<Cmd>PackerUpdate<CR>",                                                      desc = "update",               nowait = false, remap = false },
  { "<leader>T",  "<Cmd>split | resize 13 | terminal<CR>i",                                     desc = "terminal buffer",      nowait = false, remap = false },
  { "<leader>b",  group = "Buffer",                                                             nowait = false,                remap = false },
  { "<leader>bh", "<Cmd>split<CR><C-w>w<CR>:b#<CR><C-w>p<CR>",                                  desc = "split horizontaly",    nowait = false, remap = false },
  { "<leader>bl", "<Cmd>Telescope buffers<CR>",                                                 desc = "list",                 nowait = false, remap = false },
  { "<leader>bn", "<Cmd>enew<CR>",                                                              desc = "open new",             nowait = false, remap = false },
  { "<leader>bv", "<Cmd>vsplit<CR><C-w>w<CR>:b#<CR><C-w>p<CR>",                                 desc = "split verticaly",      nowait = false, remap = false },
  { "<leader>e",  "<Cmd>Telescope file_browser<CR>",                                            desc = "Explorer",             nowait = false, remap = false },
  { "<leader>f",  group = "Find",                                                               nowait = false,                remap = false },
  { "<leader>fc", "<Cmd>Telescope colorscheme<CR>",                                             desc = "colorscheme",          nowait = false, remap = false },
  { "<leader>fe", "<Cmd>Telescope env<CR>",                                                     desc = "env",                  nowait = false, remap = false },
  { "<leader>ff", "<Cmd>Telescope live_grep_args theme=ivy<CR>",                                desc = "string",               nowait = false, remap = false },
  { "<leader>fh", "<Cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>", desc = "hidden",               nowait = false, remap = false },
  { "<leader>fk", "<Cmd>Telescope keymaps<CR>",                                                 desc = "keymaps",              nowait = false, remap = false },
  { "<leader>fm", "<Cmd>Telescope man_pages<CR>",                                               desc = "man page",             nowait = false, remap = false },
  { "<leader>fp", "<Cmd>Telescope project<CR>",                                                 desc = "project",              nowait = false, remap = false },
  { "<leader>fr", "<Cmd>Telescope repo list<CR>",                                               desc = "repo",                 nowait = false, remap = false },
  { "<leader>g",  group = "Git",                                                                nowait = false,                remap = false },
  { "<leader>gd", "<CMD>lua ToggleDiffView()<CR>",                                              desc = "open diffview",        nowait = false, remap = false },
  { "<leader>gf", "<CMD>DiffviewFileHistory %<CR>",                                             desc = "current file history", nowait = false, remap = false },
  { "<leader>gh", "<CMD>DiffviewFileHistory<CR>",                                               desc = "file history",         nowait = false, remap = false },
  { "<leader>gl", "<CMD>DiffviewLog<CR>",                                                       desc = "log",                  nowait = false, remap = false },
  { "<leader>h",  "<Cmd>Telescope command_history theme=dropdown<CR>",                          desc = "History",              nowait = false, remap = false },
  { "<leader>m",  "<Cmd>Mason<CR>",                                                             desc = "Mason",                nowait = false, remap = false },
  { "<leader>p",  "<Cmd>Telescope find_files theme=dropdown previewer=true<CR>",                desc = "Open File",            nowait = false, remap = false },
  { "<leader>q",  "<Cmd>q!<CR>",                                                                desc = "Quit",                 nowait = false, remap = false },
  { "<leader>r",  "<Cmd>Telescope oldfiles theme=dropdown previewer=false<CR>",                 desc = "Recent Files",         nowait = false, remap = false },
  { "<leader>t",  group = "File Tree",                                                          nowait = false,                remap = false },
  { "<leader>tt", "<Cmd>NvimTreeToggle<CR>",                                                    desc = "toggle",               nowait = false, remap = false },
  { "<leader>w",  "<Cmd>update!<CR>",                                                           desc = "Save",                 nowait = false, remap = false },
  { "<leader>c",  "<CMD>lua BufferDelete()<CR>",                                                desc = "Close",                nowait = false, remap = false },
}

whichkey.setup()
whichkey.add(keymaps, options)


-- == Helper functions == --

function ToggleDiffView()
  print("ToggleDiffView executed")
  if next(require("diffview.lib").views) == nil then
    -- Open diff view if it's not open
    vim.cmd("DiffviewOpen")
  else
    -- Close diff view if it's already open
    vim.cmd("DiffviewClose")
  end
end

function BufferDelete()
	local current_buffer = vim.api.nvim_get_current_buf()

	if vim.api.nvim_get_option_value("modified", { buf = current_buffer }) then
		local choice = vim.fn.confirm("Buffer is modified. Save changes?", "&Yes\n&No\n&Cancel", 1)

		if choice == 1 then
			vim.cmd("write")
		elseif choice == 3 then
			return
		end

		vim.cmd("bdelete!")
	else
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
		local total_nr_buffers = #buffers

		if total_nr_buffers == 1 then
			vim.cmd("bdelete")
			vim.cmd("enew") -- Create a new empty buffer if no other listed buffer exists
		else
			vim.cmd("bprevious")
			vim.cmd("bdelete #")
		end
	end
end
