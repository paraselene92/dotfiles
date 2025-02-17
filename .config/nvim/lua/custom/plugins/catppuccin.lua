return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 100,
  config = function()
    require('catppuccin').setup {
      flavour = 'frappe',
      transparent_background = true,
      show_end_of_buffer = true,
      dim_inactive = {
        enabled = true,
        shade = 'light',
        percentage = 0.6,
      },
      no_italic = true,
      no_bold = true,
      no_underline = true,
      styles = {
        functions = { 'bold' },
        keyword = { 'bold' },
      },
      integrations = {
        fzf = true,
        treesitter = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        markdown = true,
        mason = true,
        copilot_vim = true,
      },
      color_overrides = {
        all = {
          text = '#FFFFFF',
        },
      },
    }
    vim.cmd 'colorscheme catppuccin'
  end,
}
