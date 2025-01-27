return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }

      metals_config.init_options.statusBarProvider = "on"

      -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        local map = vim.keymap.set

        -- LSP mappings
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gds", vim.lsp.buf.document_symbol)
        map("n", "gws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>cs", vim.lsp.buf.signature_help)
        map("n", "<leader>cr", vim.lsp.buf.rename)
        map("n", "<leader>cf", vim.lsp.buf.format)
        map("n", "<leader>ca", vim.lsp.buf.code_action)

        map("n", "<leader>cmw", function()
          require("metals").hover_worksheet()
        end, { desc = "Hover Worksheet" })

        -- Diagnostics
        map("n", "<leader>cda", vim.diagnostic.setqflist, { desc = "All Diagnostics" })
        map("n", "<leader>cde", function()
          vim.diagnostic.setqflist({ severity = "E" })
        end, { desc = "Workspace Errors" })
        map("n", "<leader>aw", function()
          vim.diagnostic.setqflist({ severity = "W" })
        end, { desc = "Workspace Warnings" })
        map("n", "<leader>cdb", vim.diagnostic.setloclist, { desc = "Buffer Diagnostics" })
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
