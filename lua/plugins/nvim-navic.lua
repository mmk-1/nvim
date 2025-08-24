-- This plugin shows the scope of the code block you're in. Handy for large files
-- It should integrate manually to lualine, winbar, etc. Check lualine.lua for my integration.
return {
  "SmiteshP/nvim-navic",
  event = { "CursorMoved", "BufWinEnter", "BufFilePost" },
  dependencies = {
    { "neovim/nvim-lspconfig" },
  },
  config = function()
    require('nvim-navic').setup({
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      highlight = true, -- Enable colored icons and text
      depth_limit = 3,
      depth_limit_indicator = "..",
    })

    -- Custom navic highlight groups using Catppuccin colors
    local colors = {
      blue = "#89b4fa",
      yellow = "#f9e2af",
      green = "#a6e3a1",
      flamingo = "#f2cdcd",
      peach = "#fab387",
      pink = "#f5c2e7",
      red = "#f38ba8",
      sky = "#89dceb",
      sapphire = "#74c7ec",
      text = "#cdd6f4",
      background = "NONE" -- Transparent background
    }

    -- Define navic highlight groups
    local highlights = {
      NavicIconsFile = { fg = colors.blue, bg = colors.background },
      NavicIconsModule = { fg = colors.blue, bg = colors.background },
      NavicIconsNamespace = { fg = colors.blue, bg = colors.background },
      NavicIconsPackage = { fg = colors.blue, bg = colors.background },
      NavicIconsClass = { fg = colors.yellow, bg = colors.background },
      NavicIconsMethod = { fg = colors.blue, bg = colors.background },
      NavicIconsProperty = { fg = colors.green, bg = colors.background },
      NavicIconsField = { fg = colors.green, bg = colors.background },
      NavicIconsConstructor = { fg = colors.blue, bg = colors.background },
      NavicIconsEnum = { fg = colors.green, bg = colors.background },
      NavicIconsInterface = { fg = colors.yellow, bg = colors.background },
      NavicIconsFunction = { fg = colors.blue, bg = colors.background },
      NavicIconsVariable = { fg = colors.flamingo, bg = colors.background },
      NavicIconsConstant = { fg = colors.peach, bg = colors.background },
      NavicIconsString = { fg = colors.green, bg = colors.background },
      NavicIconsNumber = { fg = colors.peach, bg = colors.background },
      NavicIconsBoolean = { fg = colors.peach, bg = colors.background },
      NavicIconsArray = { fg = colors.peach, bg = colors.background },
      NavicIconsObject = { fg = colors.peach, bg = colors.background },
      NavicIconsKey = { fg = colors.pink, bg = colors.background },
      NavicIconsNull = { fg = colors.peach, bg = colors.background },
      NavicIconsEnumMember = { fg = colors.red, bg = colors.background },
      NavicIconsStruct = { fg = colors.blue, bg = colors.background },
      NavicIconsEvent = { fg = colors.blue, bg = colors.background },
      NavicIconsOperator = { fg = colors.sky, bg = colors.background },
      NavicIconsTypeParameter = { fg = colors.blue, bg = colors.background },
      NavicText = { fg = colors.sapphire, bg = colors.background }, -- The text shown next to icons
      NavicSeparator = { fg = colors.text, bg = colors.background },
    }

    -- Apply the highlight groups
    for group, colors in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, colors)
    end
  end,
}
