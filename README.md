# DiceGame

A ruby command application for playing a multiplayer dice game. The "Game of Dice" is a multiplayer game where N players roll a 6 faced dice in a round-robin fashion. Each time a player rolls the dice their points increase by the number (1 to 6) achieved by the roll.

As soon as a player accumulates M points they complete the game and are assigned a rank. Remaining players continue to play the game till they accumulate at least M points. The game ends when all players have accumulated at least M points.

## Dependencies
* [Ruby version : 2.7.1](https://gorails.com/setup/ubuntu/20.04#ruby)
* Bundler: 1.17.3

## Configuration
```gem install bundler -v 1.17.3 && bundle install```

## Run the dice game

```ruby play.rb```

## Run the test suite

```rspec```

## Check linting

```rubocop```

## Features
- The order in which the users roll the dice is decided randomly at the start of the game.
- If a player rolls the value "6" then they immediately get another chance to roll again and move
ahead in the game.
- If a player rolls the value "1" two consecutive times then they are forced to skip their next turn
as a penalty.
- Linting **100% covered** with rubocop.
- Spec to test implemented logics with rspec.

## Gems
- [tty-prompt](https://github.com/piotrmurach/tty-prompt) for beautiful and interactive command line prompt.
- [table_print](https://github.com/arches/table_print) to print objects in nicely formatted columns for easy reading.
- [rubocop](https://github.com/rubocop-hq/rubocop) for code linting.
- [rspec](https://github.com/rspec/rspec) for specs.
