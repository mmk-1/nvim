return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    -- standalone parsers. Language parsers live in plugins/languages/.
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "css",
      "html",
      "dockerfile",
      "yaml",
      "json",
      "toml",
      "kdl",
      "rust",
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
        init_selection = "<leader>ts",
        node_incremental = "<leader>ti",
        scope_incremental = "<leader>tc",
        node_decremental = "<leader>td",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
