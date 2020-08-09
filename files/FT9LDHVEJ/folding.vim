diff --git a/autoload/lsp/ui/vim/folding.vim b/autoload/lsp/ui/vim/folding.vim
index 4d98006..4881653 100644
--- a/autoload/lsp/ui/vim/folding.vim
+++ b/autoload/lsp/ui/vim/folding.vim
@@ -1,5 +1,6 @@
 let s:folding_ranges = {}
 let s:textprop_name = 'vim-lsp-folding-linenr'
+let s:foldlevels = {}

 function! s:find_servers() abort
     return filter(lsp#get_whitelisted_servers(), 'lsp#capabilities#has_folding_range_p
rovider(v:val)')
@@ -76,31 +77,7 @@ function! lsp#ui#vim#folding#send_request(server_name, buf, sync) ab
ort
 endfunction

 function! s:foldexpr(server, buf, linenr) abort
-    let l:foldlevel = 0
-    let l:prefix = ''
-
-    for l:folding_range in s:folding_ranges[a:server][a:buf]
-        if type(l:folding_range) == type({}) &&
-         \ has_key(l:folding_range, 'startLine') &&
-         \ has_key(l:folding_range, 'endLine')
-            let l:start = l:folding_range['startLine'] + 1
-            let l:end = l:folding_range['endLine'] + 1
-
-            if (l:start <= a:linenr) && (a:linenr <= l:end)
-                let l:foldlevel += 1
-            endif
-
-            if l:start == a:linenr
-                let l:prefix = '>'
-            elseif l:end == a:linenr
-                let l:prefix = '<'
-            endif
-        endif
-    endfor
-
-    " Only return marker if a fold starts/ends at this line.
-    " Otherwise, return '='.
-    return (l:prefix ==# '') ? '=' : (l:prefix . l:foldlevel)
+    return get(s:foldlevels[a:server][a:buf], a:linenr, '0')
 endfunction

 " Searches for text property of the correct type on the given line.
@@ -164,6 +141,28 @@ function! lsp#ui#vim#folding#foldtext() abort
     return l:summary . ' (' . l:num_lines . ' ' . (l:num_lines == 1 ? 'line' : 'lines') . ') '
 endfunction

+function! s:foldlevels(folding_ranges) abort
+    let l:foldlevels = {}
+
+    for l:folding_range in a:folding_ranges
+        if type(l:folding_range) == type({}) &&
+         \ has_key(l:folding_range, 'startLine') &&
+         \ has_key(l:folding_range, 'endLine')
+            let l:start = l:folding_range['startLine'] + 1
+            let l:end = l:folding_range['endLine'] + 1
+
+            for l:i in range(l:start, l:end)
+                if !has_key(l:foldlevels, l:i)
+                    let l:foldlevels[l:i] = 0
+                endif
+                let l:foldlevels[l:i] += 1
+            endfor
+        endif
+    endfor
+
+    return l:foldlevels
+endfunction
+
 function! s:handle_fold_request(server, data) abort
     if lsp#client#is_error(a:data) || !has_key(a:data, 'response') || !has_key(a:data['response'], 'result')
         return
@@ -187,6 +186,10 @@ function! s:handle_fold_request(server, data) abort
         let s:folding_ranges[a:server] = {}
     endif
     let s:folding_ranges[a:server][l:bufnr] = l:result
+    if !has_key(s:foldlevels, a:server)
+        let s:foldlevels[a:server] = {}
+    endif
+    let s:foldlevels[a:server][l:bufnr] = s:foldlevels(l:result)

     " Set 'foldmethod' back to 'expr', which forces a re-evaluation of
     " 'foldexpr'. Only do this if the user hasn't changed 'foldmethod',
