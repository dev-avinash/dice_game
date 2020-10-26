# frozen_string_literal: true

require_relative '../app/game'

module App
  describe Game do
    before do
      @game = Game.new(2, 10)
    end

    context '#initialize' do
      it 'initializes the game with a random number of players between 2 and 4' do
        expect(@game.players.count).to be(2)
      end
    end

    context '#add players' do
      it 'should add players' do
        expect(@game.players.count).to be(2)
      end

      it "should give name's to the players" do
        expect(@game.players[0].name).to eq('Player-1')
        expect(@game.players[1].name).to eq('Player-2')
      end
    end

    context '#handle_dice' do
      it 'should should call roll dice for 6' do
        @game.current_player = @game.players[0]
        expect(@game).to receive(:roll_dice)
        expect(Console).to receive(:say).with("HURRRAY #{@game.players[0].name} got a 6, ROLL AGAIN!!!\n\n")
        @game.send(:handle_dice, 6)
      end

      it 'should should call check skip for dice value other than 6' do
        @game.current_player = @game.players[0]
        expect(@game).to receive(:check_skip)
        expect(Console).to receive(:say).with("The Dice value is ---------- 1\n\n")
        @game.send(:handle_dice, 1)
      end
    end

    context '#check_skip' do
      it 'should should mark player as skip for dice value 1 and last_score is also 1' do
        @game.current_player = @game.players[0]
        @game.current_player.last_score = 1
        expect(Console).to receive(:say)
          .with("OOOOPS!!, #{@game.players[0].name} will be skipped in the next round\n\n")
        @game.send(:check_skip, 1)
        expect(@game.current_player.skip).to be_truthy
      end

      it 'should should not mark player as skip for dice value 1 and last_score is not 1' do
        @game.current_player = @game.players[0]
        @game.send(:check_skip, 1)
        expect(@game.current_player.skip).to be_falsey
      end
    end
  end
end
