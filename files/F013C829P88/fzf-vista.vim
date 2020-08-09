+" FzfPreviewVistaCtags {{{4
+command! -nargs=* -complete=customlist,fzf_preview#args#complete_options FzfPreviewVistaCtags
+  \ :call fzf_preview#runner#fzf_run(fzf_preview#initializer#initialize('FzfPreviewVistaCtags', {}, <f-args>))
+
+function! FzfPreviewVistaCtags(additional, args) abort
+  let data = items(vista#executive#ctags#ProjectRun())
+  let source = []
+
+  for kind_and_infos in data
+    let [kind, infos] = kind_and_infos
+
+    for info in infos
+      call add(source, [info['lnum'], '[' . kind . ']', info['text'], info['tagfile']])
+    endfor
+  endfor
+
+  let preview = g:fzf_preview_grep_preview_cmd . " '{-1}:{1}'"
+
+  return {
+  \ 'source': map(fzf_preview#util#align_lists(source), { _, v -> join(v, '  ') }),
+  \ 'sink': function('fzf_preview#handler#handle_changes_and_buffer_tags'),
+  \ 'options': fzf_preview#command#get_command_options('Ctags', preview)
+  \ }
+endfunction
+" }}}4
+
+" FzfPreviewVistaBufferCtags {{{4
+command! -nargs=* -complete=customlist,fzf_preview#args#complete_options FzfPreviewVistaBufferCtags
+  \ :call fzf_preview#runner#fzf_run(fzf_preview#initializer#initialize('FzfPreviewVistaBufferCtags', {}, <f-args>))
+
+function! FzfPreviewVistaBufferCtags(additional, args) abort
+  let data = items(vista#executive#ctags#Run(expand('%:p')))
+  let source = []
+
+  for kind_and_infos in data
+    let [kind, infos] = kind_and_infos
+
+    for info in infos
+      call add(source, [info['text'] . ':' . info['lnum'], '[' . kind . ']', getline(info['lnum'])])
+    endfor
+  endfor
+
+  let preview = g:fzf_preview_grep_preview_cmd . ' ' . expand('%') . ':{1}'"
+
+  return {
+  \ 'source': map(fzf_preview#util#align_lists(source), { _, v -> join(v, '  ') }),
+  \ 'sink': function('fzf_preview#handler#handle_changes_and_buffer_tags'),
+  \ 'options': fzf_preview#command#get_command_options('BufferCtags', preview)
+  \ }
+endfunction
+" }}}4
