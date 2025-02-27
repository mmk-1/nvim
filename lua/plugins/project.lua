local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
  require("project_nvim").setup({
    manual_mode = true
  })
  require("telescope").load_extension("projects")
end

return M
