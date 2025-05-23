return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false }, -- use cmp instead
      panel = { enabled = false },
    })
  end,
}
