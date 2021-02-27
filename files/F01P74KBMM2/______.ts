vim.register({
  async callback(lines: Array<string>): Promise<void> {
    // ...
  }
})

await vim.execute(`
  function! denops#fzf(source) abort
    call fzf#run({
    \ 'source': a:source,
    \ 'sink*':  { lines -> denops#request('${vim.name}', 'callback', [lines]) },
    \ })
  endfunction
`);

await vim.call("denops#fzf", getProjectFiles());
