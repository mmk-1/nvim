local M = {
  "mfussenegger/nvim-lint",
  opts = {},
}

function M.config()
  require("lint").linters_by_ft = {
    -- javascript = { 'eslint_d' }
  }
end

return M
