return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  opts = {
    ensure_installed = { "scala", "json", "lua", "java" },
    highlight = {
      enable = true,
    },
    auto_install = true,
  },
}
