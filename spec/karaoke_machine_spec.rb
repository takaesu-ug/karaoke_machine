require File.expand_path('../lib/karaoke_machine', File.dirname(__FILE__))
require 'awesome_print'

describe KaraokeMachine do
  it "メロディ無し" do
    melody = ""
    answer = melody
    expect(KaraokeMachine.new(melody).transpose(0)).to eq answer
  end
  # ここから下のコメントを外していって、テストを全部パスさせてください！
  # it "変更無し" do
  #   melody = "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
  #   answer = melody
  #   expect(KaraokeMachine.new(melody).transpose(0)).to eq answer
  # end
  #
  # it "2上げる" do
  #   melody = "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
  #   answer = "D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   "
  #   expect(KaraokeMachine.new(melody).transpose(2)).to eq answer
  # end
end
