KARAOKE MACHINE QUESTION
===========================

放送後のメモ
---------------------------
[予備知識が無いと理解しづらかったり、意味づけが人によって異なったりするようなプログラム設計は避けるべき、というお話 #sg_study - give IT a try](http://blog.jnito.com/entry/2014/07/11/111813)

  gsubメソッドでやる /[A-G]#?/
  オライリー正規表現の本

   いちいちscanで配列にしなくても
   String gsub メソッドで置換してあげる
   Array rotateメソッド、zipメソッド, transposeメソッド ネストされた配列をto_hするとネスト部分がハッシュになる
   gsubすげー
   第一引数に正規表現、第二引数に変換用のハッシュを渡すとキーに応じたからバリューに変換される

   ***自分の書いた正規表現使わないコードとベンチマーク比べてみたら，正規表現でgsubってめちゃくちゃ速いな #sg_study***


Question
---------------------------
[CodeIQに「カラオケマシン問題」を出題しました。みんなチャレンジしてね！ - give IT a try](http://blog.jnito.com/entry/2014/06/06/104420)


```
ド ド# レ レ# ミ ファ ファ# ソ ソ# ラ ラ# シ
C  C#  D  D#  E  F    F#    G  G#  A  A#  B
```

Zipアーカイブ手順

```
git archive --format=zip HEAD --prefix=answer/ -o answer.zip
```


Run
------------------------
1. `bundle install`
2. `bundle exec rake spec` (OR `bundle exec rspec spec/` )



