return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "arkav/lualine-lsp-progress",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
        sections = {
          lualine_c = {
            "filename",
            "require'lsp-status'.status()",
          },
          lualine_x = {
            "filetype",
          },
        },
      })
    end
  }
}
