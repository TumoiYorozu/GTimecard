# GTimecard
Googleカレンダーにタイムカードを記録します。

＊環境構築

git clone https://github.com/TumoiYorozu/GTimecard.git

cd GTimecard

./GTimecard_Setup.sh


を実行してインストールしましょう。
途中でブラウザが開いて認証の確認が出るので、許可しましょう。


最後に、GTimecard_end.rbを開いて、7行目辺りの

CALENDAR_ID = 'XXXXXXXXXXXXXXXXXXXXXXXXXX@group.calendar.google.com'

を書き込むカレンダーのＩＤに書き換えます。

確認方法は、

Ｇｏｏｇｌｅカレンダー→マイカレンダー→設定クリック
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
