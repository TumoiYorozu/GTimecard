# GTimecard
Googleカレンダーにタイムカードを記録します。

＊環境構築

git clone https://github.com/TumoiYorozu/GTimecard.git

cd GTimecard

./GTimecard_Setup.sh


を実行してインストールしましょう。
途中でブラウザが開いて認証の確認が出るので、許可しましょう。


途中でカレンダーIDを聞かれるので、

XXXXXXXXXXXXXXXXXXXXXXXXXX@group.calendar.google.com

形式のカレンダーIDを書き込みます。(カッコや""は必要ありません)


確認方法は、

Googleカレンダー→マイカレンダー→設定クリック
→対象のカレンダーをクリック
「カレンダーのアドレス」の欄の「カレンダー ID:」
です。


＊使い方

仕事開始時にGTimecard_start.rbを実行します。

仕事終了時にGTimecard_end.rbを実行します。


途中で仕事の内容を書ける項目が出てきます。

yを入力すると新しく仕事した内容を記述できます。

Ctrl+Dで内容の記述を終了できます。


仕事中にもGTimecard_comment.rbを実行すると、仕事の内容をメモできます。


適宜、PATHの通ってるところにこれらのコマンドのシンボリックリンクを作成しておくとコマンド打ち込みが楽になるかもしれません。
