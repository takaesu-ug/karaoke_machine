# coding: utf-8

class KaraokeMachine
  ONE_OCTAVE_SCALES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"].freeze
  ONE_OCTAVE_SIZE = ONE_OCTAVE_SCALES.size
  REST_NOTE = " "
  A_BAR_REGEXP = /(\s|[CDEFGAB]#?)/.freeze

  attr_accessor :melody

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    melody.split("|").map {|a_bar| transpose_each_a_bar(a_bar, amount) }.join("|")
  end

  def transpose_each_a_bar(a_bar, amount)
    split_to_notes(a_bar).map {|note|
      if note == REST_NOTE
        REST_NOTE
      else
        # 負の数の場合に関してもわざわざ絶対値を使わなくても余りが次の範囲になるので添字でアクセスするので問題ない
        # [0 <= 余り < 割る数]となるため
        transposed_val = (ONE_OCTAVE_SCALES.index(note) + amount) % ONE_OCTAVE_SIZE
        ONE_OCTAVE_SCALES[transposed_val]
      end
    }.join("")
  end

  def split_to_notes(a_bar_melody)
    # selectメソッドで空白を除いているのは、
    # A_BAR_REGEXPの正規表現で分割するので無駄な空白ができてしまうため
    a_bar_melody.split(A_BAR_REGEXP).select{|v| !v.empty?}
  end
end
