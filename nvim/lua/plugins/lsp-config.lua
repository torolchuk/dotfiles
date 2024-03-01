-- List of languages that will be support LSP
lang_list = {
  "lua_ls",
  "tsserver",
  "ols",
  "grammarly",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lang_list
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-lua/lsp-status.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lspstatus = require("lsp-status")
      local cmplsp = require("cmp_nvim_lsp")
      lspstatus.register_progress()
      local cmpCapabilities = cmplsp.default_capabilities()
      for _index, lsp in ipairs(lang_list) do
        lspconfig[lsp].setup({
          on_attach = lspstatus.on_attach,
          capabilities = cmpCapabilities,
        })
      end

      vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
