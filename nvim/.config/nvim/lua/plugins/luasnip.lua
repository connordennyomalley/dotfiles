return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
}
