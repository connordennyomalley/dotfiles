return {
  "mfussenegger/nvim-jdtls",
  opts = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = require("jdtls").start_or_attach({
        cmd = { "jdtls" },
        root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
      }),
    })
    return {}
  end,
}
