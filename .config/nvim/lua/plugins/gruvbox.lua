require'gruvbox'.setup({
  undercurl = true,
  underline = true,
  bold = true,
  font_style = {
	  variables = {
		  bold = true,
		  italic = true,
	  },
  },
  -- italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = { dark0_hard = "#121212"},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
