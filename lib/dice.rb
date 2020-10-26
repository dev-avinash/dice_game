# frozen_string_literal: true

# Generate random number
class Dice
  def self.roll(player_name)
    Console.select("\n#{player_name} its your turn, Roll a dice")
    generate_random_number
  end

  def self.generate_random_number
    # random between 1 to 6
    rand(1..6)
  end
end
