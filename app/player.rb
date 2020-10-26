# frozen_string_literal: true

module App
  # This is player of game
  class Player
    attr_accessor :total_score, :name, :last_score, :skip, :rank, :won

    def initialize(name)
      @name = name
      @total_score = 0
      @skip = false
      @rank = 0
      @won = false
    end

    def won?(max_score)
      @total_score >= max_score
    end

    def update_rank(rank)
      @rank = rank
    end

    def mark_skip
      @skip = true
    end

    def mark_unskip
      @skip = false
      @last_score = 0
    end

    def mark_won
      @won = true
    end

    def update_total_score(score)
      @total_score += score
    end
  end
end
