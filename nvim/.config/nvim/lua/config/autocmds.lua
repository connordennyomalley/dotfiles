-- Metals!
-- It sets up its own autocmd

-- Lua!
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function(ev)
    vim.lsp.start({
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc" },
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
          },
        },
      },
    })
  end,
})

-- Lsp on_attach function for all language servers
vim.api.nvim_create_autocmd("LspAttach", {
  callback = require("bits.lsp").on_attach,
})

-- TS!
vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function(ev)
    vim.lsp.start({
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "typescript", "typescriptreact", "ts" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function(ev)
    vim.lsp.start({
      cmd = { "texlab" },
      filetypes = { "tex" },
    })
  end,
})

-- vim.api.nvim_create_autocmd("LspProgress", {
--   callback = function(ev)
--
--   end,
-- })

-- Formatting on save
local formatter_group = vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = formatter_group,
  command = ":FormatWrite",
})
