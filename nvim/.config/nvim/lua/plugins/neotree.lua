return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      group_empty_dirs = true,
    })
  end,
}
