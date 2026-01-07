local function usePrettier(fs, executable)
	return {
		formatCanRange = true,
		formatCommand = string.format(
			"%s '${INPUT}' ${--range-start=charStart} ${--range-end=charEnd} ",
			fs.executable(executable, fs.Scope.NODE)
		),
		formatStdin = true,
		rootMarkers = {
			"package.json",
			".prettierrc",
			".prettierrc.json",
			".prettierrc.js",
			".prettierrc.yml",
			".prettierrc.yaml",
			".prettierrc.json5",
			".prettierrc.mjs",
			".prettierrc.cjs",
			".prettierrc.toml",
			"prettier.config.js",
			"prettier.config.cjs",
			"prettier.config.mjs",
		},
	}
end

local rubocopFormatter = {
	formatCommand = string.format('rubocop -x --format simple --stdin "${INPUT}"'),
	formatStdin = true,
}

return {
	"creativenull/efmls-configs-nvim",
	version = "v1.*",
	dependencies = {
		require("dimanda.plugin.lsp"),
		"lukas-reineke/lsp-format.nvim",
	},

	config = function()
		local fs = require("efmls-configs.fs")

		local prettier = usePrettier(fs, "prettier") -- or prettierd
		local djlintHbs = {
			formatCommand = string.format(
				"%s --reformat --profile=handlebars --indent 3 - '${INPUT}'",
				fs.executable("djlint")
			),
			formatStdin = true,
		}
		local astyle = require("efmls-configs.formatters.astyle")

		local languages = require("efmls-configs.defaults").languages()
		languages = vim.tbl_extend("force", languages, {
			-- Custom languages, or override existing ones
			html = { prettier },
			toml = { prettier },
			typescript = { prettier },
			javascript = { prettier },
			typescriptreact = { prettier },
			javascriptreact = { prettier },
			vue = { prettier },
			handlebars = { djlintHbs },
			json = { prettier },
			jsonc = { prettier },
			svelte = { prettier },
			lua = { require("efmls-configs.formatters.stylua") },
			go = { require("efmls-configs.formatters.gofumpt") },
			rust = { require("efmls-configs.formatters.rustfmt") },
			c = { astyle },
			cpp = { astyle },
			ruby = {
				require("efmls-configs.linters.rubocop"),
				rubocopFormatter,
			},
		})

		local efmls_config = {
			filetypes = vim.tbl_keys(languages),
			settings = {
				rootMarkers = { ".git/" },
				languages = languages,
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
			},
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				require("lsp-format").on_attach(client, args.buf)
			end,
		})

		vim.lsp.config(
			"efm",
			vim.tbl_extend("force", efmls_config, {
				cmd = { "efm-langserver" },
			})
		)
	end,
}
