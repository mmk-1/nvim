-- Oil has no backdrop option. Dim the editor with a full-screen float
-- behind the Oil window (same idea as snacks.picker).
local backdrop ---@type integer?

local function close_backdrop()
  if backdrop and vim.api.nvim_win_is_valid(backdrop) then
    vim.api.nvim_win_close(backdrop, true)
  end
  backdrop = nil
end

local function open_backdrop()
  close_backdrop()

  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"
  -- default=true: keep this if a colorscheme already defines OilBackdrop
  vim.api.nvim_set_hl(0, "OilBackdrop", { default = true, bg = "#000000" })

  -- zindex 40 sits under Oil's float (45). winblend: lower = darker.
  backdrop = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    row = 0,
    col = 0,
    width = vim.o.columns,
    height = vim.o.lines,
    focusable = false,
    zindex = 40,
    style = "minimal",
  })
  vim.wo[backdrop].winhighlight = "Normal:OilBackdrop"
  vim.wo[backdrop].winblend = 60
end

local function toggle_oil_float(dir)
  local oil = require("oil")
  if vim.w.is_oil_win then
    oil.close()
    close_backdrop()
    return
  end

  open_backdrop()
  oil.toggle_float(dir, { preview = {} })

  -- Oil's float is now current; drop the dim layer when that window closes.
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(vim.api.nvim_get_current_win()),
    once = true,
    callback = close_backdrop,
  })
end

return {
  "stevearc/oil.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "malewicz1337/oil-git.nvim" },
  },
  keys = {
    {
      "<leader>dd",
      function()
        toggle_oil_float()
      end,
      desc = "Open Oil",
    },
  },
  lazy = false,
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    watch_for_changes = true,
    skip_confirm_for_simple_edits = true,
    float = {
      preview_split = "right",
      padding = 3,
      max_width = 0.85,
      max_height = 0.85,
      border = "rounded",
    },
    preview_win = {
      preview_method = "fast_scratch",
    },
    keymaps = {
      ["<C-s>"] = { "actions.select", opts = { vertical = true, close = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true, close = true } },
      ["H"] = { "actions.parent", mode = "n" },
      -- L enters directories only; files stay preview-only
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
}
