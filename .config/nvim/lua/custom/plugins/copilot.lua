return {
  'zbirenbaum/copilot.lua',
  lazy = false,
  priority = 1000,
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      filetypes = {
        yaml = false,
        markdown = false,
        gitcommit = true,
        ['*'] = true,
      },
    }
  end,
}
