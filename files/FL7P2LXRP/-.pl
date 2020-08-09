function! s:docker_async_request(setting) abort
	let command = ['curl', '-s', '--unix-socket', '/var/run/docker.sock', '-X', a:setting.method]

	let dump = {
				\ 'header': s:tempname(),
				\ 'response': s:tempname(),
				\ }

	let quote = s:quote()

	call add(command, '--dump-header ' .. quote .. dump.header .. quote)
	call add(command, '--output ' .. quote .. dump.response .. quote)

	if has_key(a:setting, 'param') && !empty(a:setting.param)
		let idx = 0
		let url = a:setting.url
		for p in items(a:setting.param)
			if idx ==# 0
				let url = url .. '?' .. join(p, '=')
			else
				let url = url .. '&' .. join(p, '=')
				let idx += 1
			endif
		endfor
		call add(command, quote .. url .. quote)
	else
		call add(command, quote .. a:setting.url .. quote)
	endif
	if has_key(a:setting, 'data') && !empty(a:setting.data)
		call add(command, '-d')
		call add(command, json_encode(a:setting.data))
	endif

	call job_start(join(command, ' '), {
				\ 'err_cb': function('s:docker_request_err_cb'),
				\ 'exit_cb': function('s:docker_request_exit_cb', [dump, a:setting.callback]),
				\ })
endfunction
