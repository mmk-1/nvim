return  { 
  {
    "LunarVim/primer.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme primer_dark]])
    end,
  },
}
