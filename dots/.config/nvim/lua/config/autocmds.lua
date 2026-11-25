-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable diagnostics by default in Markdown buffers (still toggleable with <leader>ud).
local markdown_fts = { "markdown", "markdown.mdx" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = markdown_fts,
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- The FileType event may already have fired for buffers opened before the
-- VeryLazy event (e.g. `nvim README.md`), so apply the same rule to them.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) and vim.tbl_contains(markdown_fts, vim.bo[buf].filetype) then
    vim.diagnostic.enable(false, { bufnr = buf })
  end
end
