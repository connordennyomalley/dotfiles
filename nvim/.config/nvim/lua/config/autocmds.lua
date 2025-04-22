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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function(ev)
    vim.lsp.start({
      cmd = { "texlab" },
      filetypes = { "tex" },
    })
  end,
})

-- Java!
vim.api.nvim_create_autocmd("FileType", {
  callback = require("jdtls").start_or_attach({
    cmd = { "jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  }),
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
