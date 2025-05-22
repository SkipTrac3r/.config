-- Load core settings
require("custom.core.options")
require("custom.core.keymaps")

-- Autoload Java LSP (jdtls) only when editing Java files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    require("custom.ftplugin.java")
  end,
})

