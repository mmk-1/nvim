local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    image = { enabled = true },
    statuscolumn = { enabled = true, folds = {open = true } },
    picker = {
      enabled = true,
      sources = {
        projects = {
          dev = { "~/projects" },
          projects = { vim.fs.normalize("~/.config/nvim") },
        },
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        header = header,
        keys = {
          { icon = "󰏗 ", key = "p", desc = "Projects", action = "<leader>pp" },
          { icon = "󰆓 ", key = "s", desc = "Sessions", action = "<leader>sr" },
          { icon = "󰥨 ", key = "e", desc = "File Browser", action = ":Oil --float ~" },
          {
            icon = "󰈞 ",
            key = "f",
            desc = "Find Files",
            action = function()
              Snacks.picker.files({ cwd = os.getenv("HOME") })
            end,
          },
          { icon = "󰗼 ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { text = "☕ I love tea.", align = "center", padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        { text = [[💭 "Hesitation is defeat."]], align = "center" },
      },
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end,       desc = "Find files" },
    {
      "<leader>ft",
      function()
        local items = {}
        for i, tab in ipairs(vim.api.nvim_list_tabpages()) do
          local win = vim.api.nvim_tabpage_get_win(tab)
          local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
          if name:find("diffview", 1, true) or name:find("Diffview", 1, true) then
            name = "Diffview"
          elseif name:find("Neogit", 1, true) then
            name = "Neogit"
          else
            name = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"
          end
          items[#items + 1] = { idx = i, text = i .. " " .. name, tab = tab }
        end
        Snacks.picker.pick({
          title = "Tabs",
          items = items,
          format = "text",
          layout = "select",
          confirm = function(picker, item)
            picker:close()
            vim.api.nvim_set_current_tabpage(item.tab)
          end,
        })
      end,
      desc = "Find tabs",
    },
    { "<leader>fc", function() Snacks.picker.commands() end,    desc = "Find commands" },
    { "<leader>fk", function() Snacks.picker.keymaps() end,     desc = "Find keymaps" },
    { "<leader>fh", function() Snacks.picker.help() end,        desc = "Find tags" },
    { "<leader>fg", function() Snacks.picker.grep() end,        desc = "Grep (Project dir)" },
    { "<leader>pp", function() Snacks.picker.projects() end,    desc = "Projects" },
    { "<leader>bb", function() Snacks.picker.buffers() end,     desc = "Find buffers" },
    { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
  },
}
