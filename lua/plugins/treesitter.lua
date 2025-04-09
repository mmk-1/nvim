local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = {
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "css",
      "html",
      "dockerfile",
      "yaml",
      "json",
      "cpp",
      "c",
      "toml",
      "kdl",
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>ss",
        node_incremental = "<leader>si",
        scope_incremental = "<leader>sc",
        node_decremental = "<leader>sd",
      },
    },
  })
end

return M
