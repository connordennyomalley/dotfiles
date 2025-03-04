local MyLsp = {}

function MyLsp.on_attach(client, bufnr)
  local map = vim.keymap.set
  local telescopePickers = require("telescope.builtin")

  -- LSP mappings
  map("n", "gd", telescopePickers.lsp_definitions)
  map("n", "gD", telescopePickers.lsp_type_definitions)
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
  map("n", "<leader>cdd", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
  map("n", "<leader>cda", vim.diagnostic.setqflist, { desc = "All Diagnostics" })
  map("n", "<leader>cde", function()
    vim.diagnostic.setqflist({ severity = "E" })
  end, { desc = "Workspace Errors" })
  map("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
  end, { desc = "Workspace Warnings" })
  map("n", "<leader>cdb", vim.diagnostic.setloclist, { desc = "Buffer Diagnostics" })
end

return MyLsp
