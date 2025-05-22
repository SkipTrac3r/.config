-- Use the official nvim-jdtls plugin
local ok, jdtls = pcall(require, "jdtls")
if not ok then
  vim.notify("nvim-jdtls not installed", vim.log.levels.ERROR)
  return
end

-- Define root markers to detect project root
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("lspconfig.util").root_pattern(unpack(root_markers))(vim.fn.getcwd())

if root_dir == nil then
  vim.notify("Java project root not found.", vim.log.levels.WARN)
  return
end

-- Define a unique workspace per project
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls_workspaces/" .. project_name

-- Load completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Start or attach to jdtls
jdtls.start_or_attach({
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
})
