return {
    {"nvim-telescope/telescope-ui-select.nvim"},
    {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim'
		},
		config = function()
            require('telescope').setup({
                extensions = {
                    ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

            require('telescope').load_extension('ui-select')
		end,
	},
}
