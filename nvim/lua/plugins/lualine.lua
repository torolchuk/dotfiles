return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "arkav/lualine-lsp-progress"
    },
    config = function()
    require("lualine").setup({
      options = {
        theme = 'dracula'
      },
      sections = {
        lualine_c = {
          "filename",
          "require'lsp-status'.status()",
        }
      },
    })
    end
  }
}
