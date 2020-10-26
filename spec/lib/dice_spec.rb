# frozen_string_literal: true

require_relative '../../lib/dice'

describe Dice do
  context '#roll' do
    it 'should return number between 1-6' do
      expect(Console).to receive(:select).with("\nplayer-1 its your turn, Roll a dice")
      expect(Dice.roll('player-1')).to be_between(1, 6).inclusive
    end
  end
end
