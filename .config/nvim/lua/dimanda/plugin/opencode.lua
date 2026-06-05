return {
	-- OpenCode.nvim plugin integration
	-- "9d4/opencode.nvim",
	dir = "/home/d/dev/github/opencode.nvim",
	cmd = "Opencode",
	keys = {
		{ "<leader>og", "<cmd>Opencode toggle<cr>", desc = "Toggle Opencode" },
		{ "<leader>oi", "<cmd>Opencode open input<cr>", desc = "Opencode input" },
		{ "<leader>oI", "<cmd>Opencode open_input_new_session<cr>", desc = "Opencode input new session" },
		{ "<leader>oO", "<cmd>Opencode open output<cr>", desc = "Opencode output" },
		{ "<leader>os", "<cmd>Opencode select_session<cr>", desc = "Opencode sessions" },
		{ "<leader>o/", "<cmd>Opencode quick_chat<cr>", mode = { "n", "x" }, desc = "Opencode quick chat" },
		{ "<leader>oa", "<cmd>Opencode agent select<cr>", mode = { "n", "x" }, desc = "Opencode agent select" },
		{ "<leader>oz", "<cmd>Opencode toggle_zoom<cr>", mode = { "n", "x" }, desc = "Opencode toggle zoom" },
		{
			"<leader>op",
			"<cmd>Opencode configure_provider<cr>",
			mode = { "n", "x" },
			desc = "Opencode configure provider and model",
		},
		{
			"<leader>oy",
			"<cmd>Opencode add_visual_selection_inline<cr>",
			mode = { "n", "x" },
			desc = "Insert visual selection inline",
		},
		{
			"<leader>oY",
			"<cmd>Opencode open_input_new_session<cr><cmd>Opencode add_visual_selection_inline<cr>",
			mode = { "n", "x" },
			desc = "New session with visual selection inline",
		},
	},
	opts = {
		preferred_picker = "snacks",
		preferred_completion = "blink",
		default_global_keymaps = false,
		default_mode = "build",
		keymap_prefix = "<leader>o",
		context = {
			diagnostics = {
				info = false,
				warning = true,
				error = true,
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				anti_conceal = { enabled = false },
				file_types = { "opencode_output" },
			},
			ft = { "Avante", "copilot-chat", "opencode_output" },
		},
		"saghen/blink.cmp",
		"folke/snacks.nvim",
	},
}
