local function toggle_oil()
  local oil = require("oil")
  if vim.bo.filetype == "oil" then
    oil.close()
  else
    oil.open(nil, { preview = {} })
  end
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
      toggle_oil,
      desc = "Open Oil",
    },
  },
  lazy = false,
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    watch_for_changes = true,
    skip_confirm_for_simple_edits = true,
    preview_win = {
      preview_method = "fast_scratch",
    },
    keymaps = {
      ["<C-v>"] = { "actions.select", opts = { vertical = true, close = true } },
      ["<C-s>"] = { "actions.select", opts = { horizontal = true, close = true } },
    },
  },
}
