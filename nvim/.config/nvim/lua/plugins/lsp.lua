return {
  -- LSP
  "neovim/nvim-lspconfig",

  -- Completion engine
  "hrsh7th/nvim-cmp",

  -- LSP source for cmp
  "hrsh7th/cmp-nvim-lsp",

  config = function()
    -- LSP (clangd)
    vim.lsp.enable("clangd")
    vim.lsp.config("clangd", {})

    -- CMP setup
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      sources = {
        { name = "nvim_lsp" },
      },
    })

    -- connect LSP → completion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("clangd", {
      capabilities = capabilities,
    })

	vim.diagnostic.config({
  		virtual_text = true,
  		signs = true,
  		underline = true,
  		update_in_insert = false,
   })
  end,
}