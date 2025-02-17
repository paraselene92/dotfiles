return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = true,
    messeage_template = ' <summary> • <author> • <date>',
    date_format = '%d/%m/%Y',
    virtual_text_column = 1,
  },
  config = function()
    require('gitblame').setup {
      enabled = true,
    }
  end,
}
