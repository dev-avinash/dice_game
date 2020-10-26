# frozen_string_literal: true

# This stimulates dice rolls
module Diceable
  private

  def roll_dice
    current_score = Dice.roll(current_player.name)
    current_player.update_total_score(current_score)

    return update_rank(current_score) if current_player.won?(@max_score)

    handle_dice(current_score)
  end

  def handle_dice(value)
    unless value == 6
      Console.say("The Dice value is ---------- #{value}\n\n")
      return check_skip(value)
    end

    Console.say("HURRRAY #{current_player.name} got a 6, ROLL AGAIN!!!\n\n")
    roll_dice
  end

  def check_skip(dice)
    return unless dice == 1

    return current_player.last_score = 1 unless current_player.last_score == 1

    current_player.mark_skip
    Console.say("OOOOPS!!, #{current_player.name} will be skipped in the next round\n\n")
  end
end
