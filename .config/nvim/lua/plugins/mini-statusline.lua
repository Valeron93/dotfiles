return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.statusline").setup({
			set_vim_settings = false,
			use_icons = true,
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 75 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 85 })
					local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
						"%<", -- Mark general truncation point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl, strings = { search, lsp, location } },
					})
				end,
				inactive = function()
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })

					return MiniStatusline.combine_groups({
						{ hl = "MiniStatuslineInactive", strings = { filename, fileinfo } },
					})
				end,
			},
		})

		-- Set up custom highlights
		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "#2e3440", fg = "#88c0d0", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "#2e3440", fg = "#a3be8c", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = "#2e3440", fg = "#ebcb8b", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { bg = "#2e3440", fg = "#d08770", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = "#2e3440", fg = "#b48ead", bold = true })
	end,
}