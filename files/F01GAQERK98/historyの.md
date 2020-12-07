## ヒストリ関連のオプション一覧 [:link:](http://zsh.sourceforge.net/Doc/Release/Options.html#History)

めっちゃある。 

- `APPEND_HISTORY` 
zshのセッション終了時に、履歴ファイルを上書きするのではなく、追加する。
デフォルトでONになってる。　

- `EXTENDED_HISTORY` :on:
開始時刻(タイムスタンプ)、経過秒数がコマンドと一緒に履歴ファイルに保存される。

- `HIST_ALLOW_CLOBBER` :on: 
リダイレクトしたとき、履歴上で `|>`置き換える。しんせつ！

- ` HIST_BEEP` 

  アクセスした履歴が存在しないときに、ビープ音を鳴らす

- `HIST_EXPIRE_DUPS_FIRST`
  履歴リストのイベント数が上限(HISTSIZE)に達したときに、古いものではなく重複したイベントを削除する
  HIST_IGNORE_ALL_DUPS 設定してればいらない気。

- `HIST_FCNTL_LOCK` 
よくわからんけど、ファイルロックに関する設定。man によるとパフォーマンスが向上するらしい。

- `HIST_FIND_NO_DUPS` :on: 
ラインエディタでヒストリ検索するときに、一度見つかったものは後続で表示しない。

- `HIST_IGNORE_ALL_DUPS` :on: 
履歴リスト登録時に、すでに同じものがあったら削除する

- `HIST_IGNORE_DUPS` :on: 
入力したコマンドが、直前のものと同じなら履歴リストに追加しない。
HIST_IGNORE_ALL_DUPS を ONにしてたらいらない

- `HIST_IGNORE_SPACE` :on: 
行の先頭がスペースの場合は、履歴リストに追加しない。というか次のコマンド入力時に消去される。

- `HIST_LEX_WORDS`
デフォルトで zshの履歴は空白で単語分割される。
このオプションがONの場合は、通常のコマンドラインと同様の方法で分割される。
らしい。 少し試しましたが違いがわからなかった。

- `HIST_NO_FUNCTIONS` :on: 
関数定義のコマンドを履歴リストに追加しない。というか次の(ry

- `HIST_NO_STORE` :on: 
ヒストリ参照コマンド`(fc -l, history) `を履歴リストに追加しない。 というか次の(ry

- `HIST_REDUCE_BLANKS` :on: 
履歴リスト登録時に、コマンドライン中の余分なスペースを削除する

- `HIST_SAVE_NO_DUPS`
履歴ファイルに書き込むとき、重複したイベントを削除する。

- `HIST_VERIFY` :on: 
ヒストリ展開を利用するときに、直接実行しない。一旦コマンドライン上に展開される。
ビビリなので ON安定

##### 以下の三つは それぞれ排他的な(同時にONにすべきじゃない)オプション

- `INC_APPEND_HISTORY`
  履歴リストにイベントを登録するのと同時に、履歴ファイルにも書き込みを行う(追加する)。

- `INC_APPEND_HISTORY_TIME`  :on: 
  コマンド終了時に、履歴ファイルに書き込む
  つまりコマンドの経過時間が正しく記録される
  逆に言うと `INC_APPEND_HISTORY` × `EXTENDED_HISTORY` の併用では**経過時間が全て0で記録される**

- `SHARE_HISTORY`
各端末で履歴(ファイル)を共有する = 履歴ファイルに対して参照と書き込みを行う。
書き込みは 時刻(タイムスタンプ) 付き
今までONにしてたが、よくよく考えるとあまりいいオプションじゃないかもしれない。

`HIST_SAVE_BY_COPY` もあるけど デフォルトONのオプションなので割愛