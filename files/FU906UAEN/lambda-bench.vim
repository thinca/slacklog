let num = 1000000

let l = range(num)
let start = reltime()
call map(l, {-> v:val * 2})
echo start->reltime()->reltimestr()

let l = range(num)
let start = reltime()
call map(l, "v:val * 2")
echo start->reltime()->reltimestr()
