
#黒魔術の行使をしてしまったので忘れないうちに整理して残しておく

#空エンターするとlsが走るやつを書こうとしたがbashで空エンターの取得をする方法が無いためフックをかけている
#bashの仕様で'. ./script_path'の実行時にDEBUGに既にフックがかかっていると再定義できないため失敗する、ユーザー入力だと再定義可能
#(変数の代入というprimitiveな行為の結果がSTATEにより変化するのは糞だと思う)

#今回の要件は、何も入力せずにEnterキーを押すとlsを表示させることとする

#bashにはプロンプトが表示される前に呼ばれるコマンドを指定できるPROMPT_COMMANDというオプションがある
#これを使いlsを実行してやればいいがそれだけだと何をしても実行されてしまう、なので何かを実行しようとする前にtrapで割り込みをかけ
#PROMPT_COMMANDを書き換える、関数の中身は一回だけlsの実行をスキップするという単純なものだ

#これで大体完成したが挙動がおかしくなる、lsの実行自体がtrapされてしまうためだ、なのでlsの実行後にPROMPT_COMMANDを書き戻す関数を用意して
#lsの代わりにそれを呼ぶように書き換える

function foo() {
    ls
    PROMPT_COMMAND=foo
}

function hoge() {
    PROMPT_COMMAND=foo
}

trap 'PROMPT_COMMAND=hoge' DEBUG
PROMPT_COMMAND=hoge