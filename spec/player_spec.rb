# frozen_string_literal: true

require_relative '../app/player'

module App
  describe Player do
    before do
      @player = Player.new('name')
    end

    context '#initialize' do
      it 'should raises an exception when initialized without argument' do
        expect { Player.new }.to raise_error(ArgumentError)
      end

      it 'should not raise an error when initialized with a valid name' do
        expect { Player.new('Player-1') }.to_not raise_error
      end
    end

    context '#won' do
      it 'should return true if total score is greater or equle to argument score' do
        @player.total_score = 20
        expect(@player.won?(20)).to be_truthy
      end

      it 'should return false if total score is less than argument score' do
        @player.total_score = 10
        expect(@player.won?(20)).to be_falsey
      end
    end

    context '#update_rank' do
      it 'should update rank of player' do
        expect(@player.rank).to be(0)
        @player.update_rank(2)
        expect(@player.rank).to be(2)
      end
    end

    context '#mark_skip' do
      it 'should mark skip as true' do
        @player.mark_skip
        expect(@player.skip).to be_truthy
      end
    end

    context '#mark_unskip' do
      it 'should mark skip as false' do
        @player.mark_unskip
        expect(@player.skip).to be_falsey
      end
    end

    context '#update_total_score' do
      it 'should update total score of player' do
        @player.update_total_score(20)
        expect(@player.total_score).to be(20)
      end
    end
  end
end
