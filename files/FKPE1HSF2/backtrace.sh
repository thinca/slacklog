#0  0x00007f551873a277 in raise () from /lib64/libc.so.6
#1  0x00007f551873b968 in abort () from /lib64/libc.so.6
#2  0x00007f551877cd37 in __libc_message () from /lib64/libc.so.6
#3  0x00007f5518784bbf in malloc_consolidate () from /lib64/libc.so.6
#4  0x00007f5518786275 in _int_malloc () from /lib64/libc.so.6
#5  0x00007f551878984c in malloc () from /lib64/libc.so.6
#6  0x00000000004e7971 in lalloc (size=0x840, message=0x1) at misc2.c:924
#7  0x00000000004e7881 in alloc_clear (size=0x840) at misc2.c:851
#8  0x00000000005ea3c3 in call_user_func (fp=0x1f621b0, argcount=0x3, argvars=0x7ffe072b05b0, rettv=0x7ffe072b08e0, firstline=0x0, lastline=0x0, selfdict=0x0)
    at userfunc.c:805
#9  0x00000000005ebe28 in call_func (funcname=0x2004d30 "<SNR>11_popup_filter", len=0xffffffff, rettv=0x7ffe072b08e0, argcount_in=0x2, argvars_in=0x7ffe072b08a0,
    argv_func=0x0, firstline=0x0, lastline=0x0, doesrange=0x7ffe072b08dc, evaluate=0x1, partial=0x2034050, selfdict_in=0x0) at userfunc.c:1621
#10 0x00000000005eb9b6 in call_callback (callback=0x2034630, len=0xffffffff, rettv=0x7ffe072b08e0, argcount=0x2, argvars=0x7ffe072b08a0, argv_func=0x0, firstline=0x0,
    lastline=0x0, doesrange=0x7ffe072b08dc, evaluate=0x1, selfdict=0x0) at userfunc.c:1465
#11 0x0000000000533e51 in invoke_popup_filter (wp=0x2034490, c=0x6b) at popupwin.c:1743
#12 0x0000000000533eb7 in popup_do_filter (c=0x6b) at popupwin.c:1765
#13 0x00000000004ac04e in vgetc () at getchar.c:1805
#14 0x00000000004ac06b in safe_vgetc () at getchar.c:1821
#15 0x00000000004f5eec in normal_cmd (oap=0x7ffe072b0ab0, toplevel=0x1) at normal.c:596
#16 0x0000000000629420 in main_loop (cmdwin=0x0, noexmode=0x0) at main.c:1370
#17 0x0000000000628bd1 in vim_main2 () at main.c:903
#18 0x0000000000628440 in main (argc=0x1, argv=0x7ffe072b0ca8) at main.c:444