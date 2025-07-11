return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-web-devicons",
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    icons = {
      separator = "→",
    },
    spec = {
      { "<leader>f", group = "File" },
      { "<leader>c", group = "Code" },
      { "<leader>ca", group = "AI" },
      { "<leader>cd", group = "Diagnostics" },
      { "<leader>x", group = "Lazy" },
      { "<leader>s", group = "Search" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffer" },
      { "<leader>w", group = "Window" },
      { "<leader><tab>", group = "Tab" },
      { "<leader>u", group = "UI" },
      { "<leader>?", group = "Buffer local" },
      { "<leader>cm", group = "Metals" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
