return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura_simple"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_fold_enabled = true
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".tmp",
        out_dir = "out",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },
}
