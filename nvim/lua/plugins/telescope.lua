return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local config = require("telescope.builtin")
      vim.keymap.set('n', "<C-p>", config.git_files, {})
      vim.keymap.set('n', "<C-S-p>", config.find_files, {})
      vim.keymap.set('n', "<leader>fg", config.live_grep, {})
      vim.keymap.set('n', "<leader>fs", config.grep_string, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local config = require("telescope").setup({
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          },
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}

