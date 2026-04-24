return {
  "ptdewey/monalisa-nvim",
  priority = 1000, -- load first
  config = function()
    vim.cmd.colorscheme("monalisa")

    -- transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}

