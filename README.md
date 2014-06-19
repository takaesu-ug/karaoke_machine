KARAOKE MACHINE QUESTION
===========================

Question
---------------------------
[CodeIQに「カラオケマシン問題」を出題しました。みんなチャレンジしてね！ - give IT a try](http://blog.jnito.com/entry/2014/06/06/104420)

参考

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
