local snippet_group = vim.api.nvim_create_augroup('user-snippet-expand', {})
vim.api.nvim_create_autocmd('CompleteDone', {
  group = snippet_group,
  desc = 'Expand LSP snippet',
  pattern = '*',
  callback = function(opts)
    local comp = vim.v.completed_item;
    local item = vim.tbl_get(comp, 'user_data', 'nvim', 'lsp', 'completion_item');

    -- check that we were given a snippet
    if (
      not item
      or not item.insertTextFormat
      or item.insertTextFormat == 1
    ) then
    return;
  end

  -- remove the inserted text
  local cursor = vim.api.nvim_win_get_cursor(0);
  local line = vim.api.nvim_get_current_line();
  local lnum = cursor[1] - 1;
  local start_char = cursor[2] - #comp.word;
  vim.api.nvim_buf_set_text(opts.buf, lnum, start_char, lnum, #line, {''});

  -- insert snippet
  local snip_text = vim.tbl_get(item, 'textEdit', 'newText') or item.insertText;
  assert(snip_text, "Language server indicated it had a snippet, but no snippet text could be found!");
  vim.snippet.expand(snip_text);
end
});

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function (args)
    vim.keymap.set({'i', 'n'}, '<C-l>', function ()
      if vim.snippet.active({direction = 1}) then
        vim.snippet.jump(1);
      end
    end,
    { buffer = args.buf, noremap = true });

    vim.keymap.set({'i', 'n'}, '<C-h>', function ()
      if vim.snippet.active({direction = 1}) then
        vim.snippet.jump(-1)
      end
    end,
    { buffer = args.buf, noremap = false });
  end
})
