return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"go",
			"javascript",
			"typescript",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"zig",
			"rust",
		}

		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start)
				vim.bo[args.buf].indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
			end,
		})

		vim.api.nvim_create_autocmd("BufReadPost", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
			once = true,
		})

	end,
}
