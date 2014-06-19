# coding: utf-8

class KaraokeMachine
  attr_accessor :melody
  MUSICAL_SCALES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"].freeze
  REST_NOTE = " "
  A_BAR_REGEXP = /(\s|[CDEFGA]#?)/.freeze

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    melody.split("|").map {|a_bar| transpose_each_a_bar(a_bar, amount) }.join("|")
  end

  def transpose_each_a_bar(a_bar, amount)
    split_to_notes(a_bar).map {|note|
      note == REST_NOTE ? REST_NOTE : MUSICAL_SCALES[MUSICAL_SCALES.index(note) + amount]
    }.join("")
  end

  def split_to_notes(a_bar_melody)
    # A_BAR_REGEXPの正規表現で分割するので無駄な空白ができてしまうのを取り除く
    a_bar_melody.split(A_BAR_REGEXP).select{|v| !v.empty?}
  end

end

