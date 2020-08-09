function s:make_gragh(percent_cpu, percent_mem) abort
	let gragh = []
	call add(gragh, "    ------------------------")
	for line_num in [100,90,80,70,60,50,40,30,20,10,0]
		" 偶数行はパーセンテージの値を表示する
		let line = ""
		if line_num % 20 ==# 0
			let line = printf("%3d -",line_num)
		else
			let line = "    |"
		endif

		if line_num <= a:percent_cpu
			let line = line .. "  ■■■■■■"
		else
			let line = line .. "        "
		endif
		if line_num <= a:percent_mem
			let line =line .. "      ■■■■■■  |"
		else
			let line =line .. "              |"
		endif

		call add(gragh, line)
	endfor
	call add(gragh, "    ------------------------")
	call add(gragh, printf("      CPU(%d%%)     MEM(%d%%)", a:percent_cpu, a:percent_mem))
	return gragh
endfunction

call popup_create(s:make_gragh(30,40),{
			\ 'moved': 'any',
			\ })
