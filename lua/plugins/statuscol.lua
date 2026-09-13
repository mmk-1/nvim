return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = { namespace = { "gitsigns.*" }, maxwidth = 1, colwidth = 1, auto = false },
          click = "v:lua.ScSa",
        },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      },
    })
  end,
}
