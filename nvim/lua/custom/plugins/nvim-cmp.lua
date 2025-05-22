return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",         -- source for text in buffer
    "hrsh7th/cmp-path",           -- source for file system paths
    "hrsh7th/cmp-nvim-lsp",       -- ✅ LSP capabilities source (needed for jdtls, etc.)
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",           -- latest major
      build = "make install_jsregexp", -- optional regex support
    },
    "saadparwaiz1/cmp_luasnip",   -- source for LuaSnip
    "rafamadriz/friendly-snippets", -- large snippet library
    "onsails/lspkind.nvim",       -- vscode-like pictograms in completion
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load VS Code-style snippets from plugins
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },     -- ✅ LSP suggestions
        { name = "luasnip" },      -- snippets
        { name = "buffer" },       -- buffer content
        { name = "path" },         -- filesystem paths
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
