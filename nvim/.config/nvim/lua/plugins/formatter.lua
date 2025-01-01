return {
  "mhartington/formatter.nvim",
  opts = {
    filetype = {
      lua = function()
        local util = require("formatter.util")
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
  },
}
