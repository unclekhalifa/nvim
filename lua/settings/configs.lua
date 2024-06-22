-- Settings
local indent = 2

local options = {
  cursorline = true,         -- Highlight the line with the cursor
  number = true,             -- Show line numbers
  relativenumber = true,     -- Show relative line numbers
  signcolumn = "yes",        -- Always show the sign column (for LSP diagnostics, breakpoints, etc.)
  showtabline = 2,           -- Always show the tab line
  termguicolors = true,      -- Enable 24-bit RGB color in the terminal
  title = true,              -- Set the window title to the file name

  scrolloff = 12,            -- Keep 12 lines visible above/below the cursor
  sidescrolloff = 120,       -- Keep 120 columns visible to the left/right of the cursor (when wrap is off)
  smartindent = true,        -- Enable smart indentation
  expandtab = true,          -- Use spaces instead of tabs
  wrap = false,              -- Disable line wrapping
  shiftwidth = indent,       -- Set the number of spaces to use for each step of (auto)indent
  tabstop = indent,          -- Set the number of spaces that a <Tab> in the file counts for
  softtabstop = indent,      -- Set the number of spaces that a <Tab> counts for while editing

  clipboard = "unnamedplus", -- Use the system clipboard

  cdhome = true,             -- Change working directory to $HOME if no arguments are supplied

  ignorecase = true,         -- Ignore case in search patterns
  smartcase = true,          -- Override ignorecase if search pattern contains uppercase letters

  splitbelow = true,         -- Horizontal splits will be below
  splitright = true,         -- Vertical splits will be to the right

  timeoutlen = 250,          -- Time in milliseconds to wait for a mapped sequence to complete

  list = true,

  -- listchars = {
  --   tab = "» ", -- Tab character
  --   extends = "›", -- Character to show in the last column when the line extends
  --   precedes = "‹", -- Character to show in the first column when the line precedes
  --   trail = "·", -- Trail character to show for lines that extend beyond the screen
  --   nbsp = "␣", -- Character to show for non-breaking spaces
  --   space = "·" -- Character to show for spaces
  -- }


}

-- Add all the options using for loop
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
