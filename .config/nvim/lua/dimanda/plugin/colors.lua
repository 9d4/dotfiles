return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},

			groups = {
				-- border = "muted",
				-- link = "iris",
				-- panel = "surface",
				--
				-- error = "love",
				-- hint = "iris",
				-- info = "foam",
				-- note = "pine",
				-- todo = "rose",
				-- warn = "gold",
				--
				-- git_add = "foam",
				-- git_change = "rose",
				-- git_delete = "love",
				-- git_dirty = "rose",
				-- git_ignore = "muted",
				-- git_merge = "iris",
				-- git_rename = "pine",
				-- git_stage = "iris",
				-- git_text = "rose",
				-- git_untracked = "subtle",
				--
				-- h1 = "iris",
				-- h2 = "foam",
				-- h3 = "rose",
				-- h4 = "gold",
				-- h5 = "pine",
				-- h6 = "foam",
			},

			palette = {
				-- Override the builtin palette per variant
				-- moon = {
				--     base = '#18191a',
				--     overlay = '#363738',
				-- },
			},

			-- NOTE: Highlight groups are extended (merged) by default. Disable this
			-- per group via `inherit = false`
			highlight_groups = {
				-- Comment = { fg = "foam" },
				-- StatusLine = { fg = "love", bg = "love", blend = 15 },
				-- VertSplit = { fg = "muted", bg = "muted" },
				-- Visual = { fg = "base", bg = "text", inherit = false },
			},

			before_highlight = function(group, highlight, palette)
				-- Disable all undercurls
				-- if highlight.undercurl then
				--     highlight.undercurl = false
				-- end
				--
				-- Change palette colour
				-- if highlight.fg == palette.pine then
				--     highlight.fg = palette.foam
				-- end
			end,
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
-- return {
-- 	"vague-theme/vague.nvim",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other plugins
-- 	config = function()
-- 		-- NOTE: you do not need to call setup if you don't want to.
-- 		require("vague").setup({
-- 			-- optional configuration here
-- 		})
-- 		vim.cmd("colorscheme vague")
-- 	end,
-- }
-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nordic").setup({
-- 			-- This callback can be used to override the colors used in the base palette.
-- 			on_palette = function(palette) end,
-- 			-- This callback can be used to override the colors used in the extended palette.
-- 			after_palette = function(palette) end,
-- 			-- This callback can be used to override highlights before they are applied.
-- 			on_highlight = function(highlights, palette) end,
-- 			-- Enable bold keywords.
-- 			bold_keywords = true,
-- 			-- Enable italic comments.
-- 			italic_comments = true,
-- 			-- Enable editor background transparency.
-- 			transparent = {
-- 				-- Enable transparent background.
-- 				bg = true,
-- 				-- Enable transparent background for floating windows.
-- 				float = true,
-- 			},
-- 			-- Enable brighter float border.
-- 			bright_border = false,
-- 			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
-- 			reduced_blue = false,
-- 			-- Swap the dark background with the normal one.
-- 			swap_backgrounds = true,
-- 			-- Cursorline options.  Also includes visual/selection.
-- 			cursorline = {
-- 				-- Bold font in cursorline.
-- 				bold = false,
-- 				-- Bold cursorline number.
-- 				bold_number = true,
-- 				-- Available styles: 'dark', 'light'.
-- 				theme = "light",
-- 				-- Blending the cursorline bg with the buffer bg.
-- 				blend = 0.5,
-- 			},
-- 			noice = {
-- 				-- Available styles: `classic`, `flat`.
-- 				style = "flat",
-- 			},
-- 			telescope = {
-- 				-- Available styles: `classic`, `flat`.
-- 				style = "flat",
-- 			},
-- 			leap = {
-- 				-- Dims the backdrop when using leap.
-- 				dim_backdrop = false,
-- 			},
-- 			ts_context = {
-- 				-- Enables dark background for treesitter-context window
-- 				dark_background = true,
-- 			},
-- 		})
--
-- 		require("nordic").load()
-- 	end,
-- }
