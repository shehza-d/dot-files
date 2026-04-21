return {
	'nvim-mini/mini.nvim',
   	-- old 'echasnovski/mini.vim',
   	enabled = true,
   	config = function ()
		local statusline = require 'mini.statusline'
		statusline.setup { use_icons = true }
	end
}
