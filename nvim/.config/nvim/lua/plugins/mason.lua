return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").tilt_ls.setup({})
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
    },
    config = function(opts)
      require("mason-lspconfig").setup(opts)

      require("lspconfig").lua_ls.setup({})
    end,
  },
}
