local M = {
  "mfussenegger/nvim-lint",
  opts = {},
}

function M.config()
  require("lint").linters_by_ft = {
    -- javascript = { "eslint" },
    -- typescript = { "eslint" },
  }
end

return M
