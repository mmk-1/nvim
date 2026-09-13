vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function safe_require(module)
  local ok, err = xpcall(function()
    require(module)
  end, debug.traceback)

  if not ok then
    vim.schedule(function()
      vim.notify(("Failed to load `%s`:\n%s"):format(module, err), vim.log.levels.ERROR, {
        title = "Neovim configuration",
      })
    end)
  end
end

safe_require("config.keymaps")
safe_require("config.options")
safe_require("config.lazy")
