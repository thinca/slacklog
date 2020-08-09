* `make _logdata` - ログをダウンロードしてきて \_logdata/ へ展開する。 log-data.tar.gz はローカルにキャッシュするので2回目やっても何もおこらない
* `make _logdata-clean` - \_logdata/ を消す。このあと `make _logdata` するとキャッシュからの復帰になる
* `make _logdata-distclean` - \_logdata/ とキャッシュを消す。このあと `make _logdata` するとダウンロードからやり直す

ここまでは基本の3つ。以下は基本を組み合わせて作るやつ

* `make _logdata-restore` - 壊れた \_logdata/ を直す目的。 \_logdata-clean & \_logdata してるだけ
* `make _logdata-update` - \_logdata/ を最新版にする目的。 \_logdata-distclean & \_logdata してるだけ