local status, lspkind = pcall(require, "lspkind")
if not status then
  print("lspkind not found!")
end

lspkind.init({
  mode = "symbol",
  preset = "codicons",
})
