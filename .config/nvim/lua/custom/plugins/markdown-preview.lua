return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  config = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_browser = '/opt/vivaldi/vivaldi'
  end,
  ft = { 'markdown' },
}
