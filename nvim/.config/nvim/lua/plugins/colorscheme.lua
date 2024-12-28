return {
  -- add dracula
  { "Mofiqul/dracula.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim" },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      -- Dark
      colorscheme = "catppuccin-frappe",
      -- Light
      -- colorscheme = "catppuccin-latte",
    },
  },
}
