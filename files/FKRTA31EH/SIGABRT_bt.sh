(gdb) bt
#0  0x00007f1379f02277 in raise () from /lib64/libc.so.6
#1  0x00007f1379f03968 in abort () from /lib64/libc.so.6
#2  0x00007f1379f44d37 in __libc_message () from /lib64/libc.so.6
#3  0x00007f1379f4d499 in _int_free () from /lib64/libc.so.6
#4  0x00000000004e8a18 in vim_free (x=0x1cdd7c0) at misc2.c:1805
#5  0x000000000041ccd3 in dict_free_dict (d=0x1cdd7c0) at dict.c:142
#6  0x000000000041cd03 in dict_free (d=0x1cdd7c0) at dict.c:151
#7  0x000000000041dd8c in dict_get_tv (arg=0x7ffc180e5ae8,
    rettv=0x7ffc180e59a0, evaluate=0x1) at dict.c:815
#8  0x0000000000436fda in eval7 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1, want_string=0x0) at eval.c:4561
#9  0x0000000000436788 in eval6 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1, want_string=0x0) at eval.c:4237
#10 0x00000000004361a2 in eval5 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1) at eval.c:4028
#11 0x0000000000435eb2 in eval4 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1) at eval.c:3910
#12 0x0000000000435d21 in eval3 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1) at eval.c:3830
#13 0x0000000000435b9e in eval2 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1) at eval.c:3762
#14 0x00000000004359dd in eval1 (arg=0x7ffc180e5ae8, rettv=0x7ffc180e59a0,
    evaluate=0x1) at eval.c:3690
#15 0x00000000005ea03e in get_func_tv (
    name=0x1c15700 "job_start( ['curl', 'https://tenki.jp/amedas/3/17/46106.html', '-x', 'http://21023163:%21hiic5@133.144.14.240:8888'], {'out_cb', function('s:show_rainfall')})", len=0x9, rettv=0x7ffc180e5ff0, arg=0x7ffc180e5f88,
    firstline=0x5, lastline=0x5, doesrange=0x7ffc180e5b74, evaluate=0x1,
    partial=0x0, selfdict=0x0) at userfunc.c:460
#16 0x0000000000437292 in eval7 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1, want_string=0x0) at eval.c:4642
#17 0x0000000000436788 in eval6 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1, want_string=0x0) at eval.c:4237
#18 0x00000000004361a2 in eval5 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1) at eval.c:4028
#19 0x0000000000435eb2 in eval4 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1) at eval.c:3910
#20 0x0000000000435d21 in eval3 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1) at eval.c:3830
#21 0x0000000000435b9e in eval2 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1) at eval.c:3762
#22 0x00000000004359dd in eval1 (arg=0x7ffc180e5f88, rettv=0x7ffc180e5ff0,
    evaluate=0x1) at eval.c:3690
#23 0x0000000000435921 in eval0 (
    arg=0x1c0eefe "job_start( ['curl', 'https://tenki.jp/amedas/3/17/46106.html', '-x', 'http://21023163:%21hiic5@133.144.14.240:8888'], {'out_cb', function('s:---Type <return> to continue, or q <return> to quit---
show_rainfall')})", rettv=0x7ffc180e5ff0, nextcmd=0x7ffc180e6188, evaluate=0x1)
    at eval.c:3648
#24 0x0000000000430f38 in ex_let_const (eap=0x7ffc180e6180, is_const=0x0)
    at eval.c:1447
#25 0x0000000000430b84 in ex_let (eap=0x7ffc180e6180) at eval.c:1348
#26 0x00000000004741d1 in do_one_cmd (cmdlinep=0x7ffc180e6818, sourcing=0x1,
    cstack=0x7ffc180e6370, fgetline=0x5f067d <get_func_line>, cookie=0x1cdd980)
    at ex_docmd.c:2500
#27 0x0000000000471955 in do_cmdline (cmdline=0x0,
    fgetline=0x5f067d <get_func_line>, cookie=0x1cdd980, flags=0x7)
    at ex_docmd.c:995
#28 0x00000000005eb4ca in call_user_func (fp=0x1b4bb80, argcount=0x1,
    argvars=0x7ffc180e6f90, rettv=0x7ffc180e6fc0, firstline=0x0, lastline=0x0,
    selfdict=0x0) at userfunc.c:1063
#29 0x00000000005ec393 in call_func (
    funcname=0x1b4bd10 "<SNR>53_get_rainfall", len=0xffffffff,
    rettv=0x7ffc180e6fc0, argcount_in=0x1, argvars_in=0x7ffc180e6f90,
    argv_func=0x0, firstline=0x0, lastline=0x0, doesrange=0x7ffc180e6fbc,
    evaluate=0x1, partial=0x0, selfdict_in=0x0) at userfunc.c:1621
#30 0x00000000005ebf21 in call_callback (callback=0x1cdd958, len=0xffffffff,
    rettv=0x7ffc180e6fc0, argcount=0x1, argvars=0x7ffc180e6f90, argv_func=0x0,
    firstline=0x0, lastline=0x0, doesrange=0x7ffc180e6fbc, evaluate=0x1,
    selfdict=0x0) at userfunc.c:1465
#31 0x0000000000469a20 in timer_callback (timer=0x1cdd920) at ex_cmds2.c:328
#32 0x0000000000469bda in check_due_timer () at ex_cmds2.c:390
#33 0x00000000005ddfb1 in ui_wait_for_chars_or_timer (wtime=0xfa0,
    wait_func=0x52c164 <WaitForCharOrMouse>, interrupted=0x7ffc180e7150,
    ignore_input=0x0) at ui.c:454
#34 0x000000000052c159 in WaitForChar (msec=0xfa0, interrupted=0x7ffc180e7150,
    ignore_input=0x0) at os_unix.c:5940
#35 0x00000000005ddec2 in inchar_loop (buf=0x8c539b <typebuf_init+59> "\r",
    maxlen=0x44, wtime=0xffffffffffffffff, tb_change_cnt=0x18,
    wait_func=0x52c12e <WaitForChar>, resize_func=0x5274c8 <resize_func>)
    at ui.c:383
#36 0x0000000000527531 in mch_inchar (buf=0x8c539b <typebuf_init+59> "\r",
    maxlen=0x44, wtime=0xffffffffffffffff, tb_change_cnt=0x18) at os_unix.c:388
#37 0x00000000005ddcbe in ui_inchar (buf=0x8c539b <typebuf_init+59> "\r",
    maxlen=0x44, wtime=0xffffffffffffffff, tb_change_cnt=0x18) at ui.c:231
#38 0x00000000004addf9 in inchar (buf=0x8c539b <typebuf_init+59> "\r",
    maxlen=0xcd, wait_time=0xffffffffffffffff) at getchar.c:3092
#39 0x00000000004ada43 in vgetorpeek (advance=0x1) at getchar.c:2870
#40 0x00000000004abdb5 in vgetc () at getchar.c:1602
#41 0x00000000004ac282 in safe_vgetc () at getchar.c:1821
#42 0x00000000004f617a in normal_cmd (oap=0x7ffc180e7560, toplevel=0x1)
    at normal.c:596
#43 0x00000000006299a9 in main_loop (cmdwin=0x0, noexmode=0x0) at main.c:1370
#44 0x000000000062915a in vim_main2 () at main.c:903
#45 0x00000000006289c9 in main (argc=0x2, argv=0x7ffc180e7758) at main.c:444