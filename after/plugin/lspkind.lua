local status, lspkind = pcall(require, "lspkind")
if not status then
  print("lspkind not found!")
end

lspkind.init({
  symbol_map = {
    Supermaven = "",
  },
  mode = "symbol",
  preset = "codicons",
})

vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", {fg ="#6CC644"})
