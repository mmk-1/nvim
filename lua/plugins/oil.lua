return {
  "stevearc/oil.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  keys = {
    { "<leader>dd", "<cmd>Oil<cr>", desc = "Open Oil" },
  },
  lazy = false,
  opts = {
    default_file_explorer = true,
    preview_win = {
      preview_method = "fast_scratch",
    },
    keymaps = {
      ["<C-s>"] = { "actions.select", opts = { vertical = true, close = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true, close = true } },
      ["H"] = { "actions.parent", mode = "n" },
      -- only move between dirs, don't open files with L
      ["L"] = {
        mode = "n",
        desc = "Enter directory",
        callback = function()
          local oil = require("oil")
          local entry = oil.get_cursor_entry()
          if entry and entry.type == "directory" then
            oil.select()
          end
        end,
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilEnter",
      callback = vim.schedule_wrap(function(args) 
        local oil = require("oil")
        if vim.wo.previewwindow or vim.api.nvim_get_current_buf() ~= args.data.buf then
          return
        end
        if oil.get_cursor_entry() then
          oil.open_preview({ vertical = true, split = "botright" })
        end
      end),
    })
  end,
}
