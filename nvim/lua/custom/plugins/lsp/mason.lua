return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "dockerls",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "marksman",
        "powershell_es",
        "pyright",
        "sqlls",
        "vimls",
        "lemminx",
        "yamlls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- ✅ Formatters
        "prettier",
        "stylua",
        "isort",
        "black",
        "shfmt",
        "sql-formatter",
        "xmlformatter",
        "clang-format",
        "goimports",

        -- ✅ Linters
        "luacheck",
        "pylint",
        "shellcheck",
        "yamllint",
        "golangci-lint",
        "eslint_d",
      },
    })
  end,
}
