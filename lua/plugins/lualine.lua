return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = function()
        local h = require("lualine.themes.horizon")
        for _, m in pairs(h) do
          m.b.fg = "#FFFFFF"
          m.c.fg, m.c.bg = "#FFFFFF", "#232530"
        end
        return h
      end,
      globalstatus = true,
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "lsp_status", "filetype" },
      lualine_y = {
        function()
          return ("tabs: %d/%d"):format(vim.fn.tabpagenr(), vim.fn.tabpagenr("$"))
        end,
      },
      lualine_z = { "location" },
    },
    extensions = { "oil", "lazy", "trouble", "quickfix" },
  },
}