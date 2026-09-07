return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    disable_filetype = { "snacks_picker_input", "spectre_panel" },
    fast_wrap = {
      -- map = false, -- what is this?
      use_virt_lines = false,
    },
  },
}
