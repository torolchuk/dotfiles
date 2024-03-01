return {
  "goolord/alpha-nvim",
  config = function()
    local theme = require("alpha.themes.dashboard")
    -- theme.header.value = "s"
    require("alpha").setup(theme.config)
  end,
}
