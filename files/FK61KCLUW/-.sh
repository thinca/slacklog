(SSH) ~/vim/src (master)$ make test_popupwin
cd testdir; make test_popupwin VIMPROG=../vim  SCRIPTSOURCE=../../runtime
make[1]: ディレクトリ '/home/disco/vim/src/testdir' に入ります
rm -f test_popupwin.res test.log messages
make -f Makefile test_popupwin.res
make[2]: ディレクトリ '/home/disco/vim/src/testdir' に入ります
rm -rf test1.failed test.out X* viminfo tiny.vim small.vim mbyte.vim mzscheme.vim test.ok benchmark.out wrongtermsize
VIMRUNTIME=../../runtime; export VIMRUNTIME;  ../vim -f  -u unix.vim -U NONE --noplugin --not-a-term -s dotest.in test1.in --cmd 'au SwapExists * let v:swapchoice = "e"' > /dev/null
rm -rf X* viminfo
VIMRUNTIME=../../runtime; export VIMRUNTIME;  ../vim -f  -u unix.vim -U NONE --noplugin --not-a-term -S runtest.vim test_popupwin.vim --cmd 'au SwapExists * let v:swapchoice = "e"' > /dev/null
make[2]: ディレクトリ '/home/disco/vim/src/testdir' から出ます
cat messages


From test_popupwin.vim:
Executing Test_popup_getposition()
Executing Test_popup_hide()
Executing Test_popup_move()
Executing Test_popup_time()
Executing Test_popup_width_longest()
Executing Test_popup_wraps()
Executing Test_simple_popup()
Executed 7 tests
make[1]: ディレクトリ '/home/disco/vim/src/testdir' から出ます
