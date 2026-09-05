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
    { "<leader>fc", function() Snacks.picker.commands() end,    desc = "Find commands" },
    { "<leader>fk", function() Snacks.picker.keymaps() end,     desc = "Find keymaps" },
    { "<leader>fh", function() Snacks.picker.help() end,        desc = "Find tags" },
    { "<leader>fg", function() Snacks.picker.grep() end,        desc = "Grep (Project dir)" },
    { "<leader>pp", function() Snacks.picker.projects() end,    desc = "Projects" },
    { "<leader>bb", function() Snacks.picker.buffers() end,     desc = "Find buffers" },
    { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
  },
}
