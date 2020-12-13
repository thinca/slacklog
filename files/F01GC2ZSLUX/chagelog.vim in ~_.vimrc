augroup changelog
  "let g:changelog_dateformat="%Y-%m-%d (%a) %H:%M:%S"
  let g:changelog_dateformat="%Y-%m-%d (%a)"
  "let g:changelog_new_date_format="%d  %u\n\n\t* %p%c\n\n"
  "カーソルのポジションはよく分からん。なんでや。
  let g:changelog_new_date_format="%d  %u\n\n* %c%p\n\n"
  let g:changelog_new_entry_format="\t- %c%p"

  " 下記をコメントにして、memoディレクトリを作って運用する。
  " ファイルを開いた段階で、日付がでる。なんか多重起動してるっぽい
  " 動きなのである。2020-12-13
  " 下記の設定を入れたので、Changelogの<leader>oが効かなくなった。なんでや
  " Changelogは、today.changelog にファイル名を変えて試験運用中
  " 拡張子changelogのファイルを開いた時に、ファイルタイプをchangelogにする場合の設定例
  "autocmd BufNewFile,BufRead *.changelog setf changelog

augroup END
