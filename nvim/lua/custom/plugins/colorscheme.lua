return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",       -- or "storm", "day", "moon"
        transparent = true,    -- Enable transparent background
        on_highlights = function(hl, c)
          hl.LineNr = { fg = "#AABBDD" }        -- Current line number
          hl.LineNrAbove = { fg = "#CCEFFF" }   -- Relative lines above
          hl.LineNrBelow = { fg = "#CCEFFF" }   -- Relative lines below
        end,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}

