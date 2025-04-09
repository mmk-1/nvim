local M = {
  'saghen/blink.cmp',
  dependencies = {
    {
      'rafamadriz/friendly-snippets',
    },
    {
      "folke/lazydev.nvim",
    },
    {
      "onsails/lspkind.nvim",
    },
    {
      "nvim-tree/nvim-web-devicons",
    },
  },
  version = '1.*',
  opts_extend = { "sources.default" }
}

-- Important keybindings:
--  C-k -> Signature
--  C-space -> Open doc window

function M.config()
  local cmp = require('blink.cmp')

  -- You need to change colors using the highlight groups
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#49443C" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#C8F902" })

  cmp.setup({
    keymap = { preset = 'super-tab' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = {
        window = { border = 'rounded', },
        auto_show = false
      },

      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,

              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local _, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_hl then
                    return dev_hl
                  end
                end

                -- Define custom highlights based on completion kind
                local highlights = {
                  Text = "String",         -- Green
                  Method = "Function",     -- Blue
                  Function = "Function",   -- Blue
                  Constructor = "Type",    -- Yellow
                  Variable = "Identifier", -- White
                  Class = "Type",          -- Yellow
                  Interface = "Type",      -- Yellow
                  Module = "Include",      -- Purple
                  Property = "@property",  -- Cyan
                  Keyword = "Keyword",     -- Purple
                  Snippet = "Label",       -- Orange
                  Color = "Special",       -- Purple
                  File = "Directory",      -- Blue
                  Folder = "Directory",    -- Blue
                }
                return highlights[ctx.kind] or "Normal"
              end,
            },
            kind = {
              highlight = function(_)
                return "Comment" -- This will make the text gray
              end,
            }
          }
        },
        border = 'rounded'
      },
    },

    sources = {
      default = {
        'lazydev',
        'snippets',
        'lsp',
        'path',
        'buffer'
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = {
      enabled = false
    }, -- this conflics with some other plugin when true (two popup windows)

    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = false,
        },
      }
    },
  })
end

return M
