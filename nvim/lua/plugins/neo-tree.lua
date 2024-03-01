return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local setupCmd = ":Neotree filesystem reveal left<CR>"
    vim.keymap.set("n", "<C-n>", setupCmd, {})
    vim.keymap.set("n", "<C-S-n>", ":Neotree close<CR>", {})
    vim.api.nvim_create_augroup("neotree", {})
    vim.api.nvim_create_autocmd("VimEnter", {
      desc = "Open Neotree automatically",
      group = "neotree",
      callback = function()
        if vim.fn.argc() == 0 and not vim.fn.exists("s:std_in") then
          vim.cmd("Neotree toggle")
        end
      end,
    })
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    })
  end,
}
