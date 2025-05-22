return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				json = { "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				markdown_inline = { "prettier" },
				javascript = { "prettier" },
				bash = { "shfmt" },
				sql = { "sql_formatter" }, -- install with Mason or use "pg_format"
				xml = { "xmlformat" }, -- optional: can fallback to LSP
				java = {}, -- handled by jdtls (LSP)
				c = { "clang_format" },
				go = { "gofmt", "goimports" },
				powershell = {}, -- optionally hook PSScriptAnalyzer manually
				dockerfile = {}, -- no standard formatter; LSP maybe
				vim = {}, -- typically no formatter
				vimdoc = {}, -- same
				gitignore = {}, -- not needed
				query = {}, -- internal TS query files – skip
				tmux = {}, -- rarely needed
			},

			-- Auto format on save with fallback to LSP
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		-- Manual format keymap
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
