return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
        -- require("metals").setup_dap()

        local map = vim.keymap.set

        -- LSP mappings
        map("n", "gD", vim.lsp.buf.definition)
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

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        -- map("n", "<leader>dc", function()
        --   require("dap").continue()
        -- end)
        --
        -- map("n", "<leader>dr", function()
        --   require("dap").repl.toggle()
        -- end)
        --
        -- map("n", "<leader>dK", function()
        --   require("dap.ui.widgets").hover()
        -- end)
        --
        -- map("n", "<leader>dt", function()
        --   require("dap").toggle_breakpoint()
        -- end)
        --
        -- map("n", "<leader>dso", function()
        --   require("dap").step_over()
        -- end)
        --
        -- map("n", "<leader>dsi", function()
        --   require("dap").step_into()
        -- end)
        --
        -- map("n", "<leader>dl", function()
        --   require("dap").run_last()
        -- end)
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
