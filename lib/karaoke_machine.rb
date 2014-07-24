# coding: utf-8

class KaraokeMachine
  ONE_OCTAVE_SCALES = %w(C C# D D# E F F# G G# A A# B).freeze
  NOTE_REGEXP = / |\||[CDEFGAB]#?/.freeze # 空白, |, [CDEFGAB]#? の文字を定義
  NOT_TRANSPOSE_REGEXP = / |\|/.freeze
  attr_reader :melody

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    # refs. http://docs.ruby-lang.org/ja/1.8.7/class/String.html#I_SCAN
    melody.scan(NOTE_REGEXP).map {|note|
      if not_transpose_note?(note)
        note
      else
        # 負の数の場合に関してもわざわざ絶対値を使わなくても余りが次の範囲になり添字でアクセスするので問題ない
        # [0 <= 余り < 割る数]となるため(余りは整数となる)
        transposed_note_index = (ONE_OCTAVE_SCALES.index(note) + amount) % ONE_OCTAVE_SCALES.size
        ONE_OCTAVE_SCALES[transposed_note_index]
      end
    }.join("")
  end

  def not_transpose_note?(note)
    note =~ NOT_TRANSPOSE_REGEXP
  end
end

class KaraokeMachineGsub
  SCALES = %w(C C# D D# E F F# G G# A A# B).freeze

  attr_reader :melody
  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    melody.gsub(/[A-G]#?/) do |m|
      move_index = (SCALES.index(m) + amount) % SCALES.size
      SCALES[move_index]
    end
  end

  def transpose_exemplary(amount)
    # 変換テーブル converter を作ってgsubにハッシュを渡して変換する
    converter = [SCALES, SCALES.rotate(amount)].transpose.to_h
    melody.gsub(/[A-G]#?/, converter)
  end
end
