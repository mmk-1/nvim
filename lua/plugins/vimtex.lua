local M = {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura_simple"
    -- vim.g.vimtex_view_general_viewer = "okular"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    -- vim.g.vimtex_context_pdf_viewer = "okular"
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_fold_enabled = true
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = ".tmp", -- Set auxiliary files directory to .tmp
      out_dir = "out",  -- Leave out_dir empty to keep the .pdf in the same directory
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
}

return M
