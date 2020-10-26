# frozen_string_literal: true

require_relative '../lib/console'
require_relative '../lib/dice'
require_relative './player'
require_relative './concerns/diceable'

module App
  # This stimulates game turns and dice rolls
  class Game
    attr_accessor :players, :current_player, :max_score

    include Diceable

    def initialize(players_count, max_score)
      @max_score = max_score.to_i
      @players = add_players(players_count)
    end

    def start
      shuffle_players
      display_players
      game_turn while active_players.length.positive?

      Console.say("\n================Game Over!!================")
    end

    private

    def game_turn
      active_players.each do |player|
        if player.skip
          player.mark_unskip
          next
        end
        @current_player = player
        roll_dice
      end

      display_players
    end

    # add players
    def add_players(players_count)
      players = []

      1.upto(players_count.to_i) do |i|
        players << Player.new("Player-#{i}")
      end

      players
    end

    # displays the players and sets the starting player
    def display_players
      Console.display_table(@players)
    end

    # shuffle players
    def shuffle_players
      @players.shuffle!
    end

    def update_rank(current_score)
      current_player.mark_won
      current_player.update_rank(won_players.length)

      Console.say("The Dice value is ---------- #{current_score}\n\n")
      Console.say("HURRRAY! #{current_player.name} have completed "\
       "final score and secured rank #{current_player.rank}\n\n")
    end

    def active_players
      players.reject(&:won)
    end

    def won_players
      players.select(&:won)
    end
  end
end
