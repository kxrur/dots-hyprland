return {
  "iamcco/markdown-preview.nvim",
  init = function()
    -- Keep the preview open when switching away from the Markdown buffer.
    -- Default is 1, which closes the preview on BufHidden (i.e. whenever you
    -- switch to another file, including another .md file).
    vim.g.mkdp_auto_close = 0
  end,
}
