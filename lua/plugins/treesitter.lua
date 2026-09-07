return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
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
    },
  },
  config = function(_, opts)
    local parsers = opts.ensure_installed or {}
    if #parsers > 0 then
      require("nvim-treesitter").install(parsers)
    end

    -- Features are not enabled by the installer; see :h nvim-treesitter-quickstart
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then
          return
        end
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
