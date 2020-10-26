# frozen_string_literal: true

require './app/game'
require './lib/console'

Console.say('Welcome. We have the following players:')

players_count = Console.ask('Enter number of players:', 'should be an integer greater than 0')

max_score = Console.ask('Enter max of score:', 'should be an integer greater than 0"')

Console.say("\n -------------------------------------- ")
Console.say("\n|                                      |")
Console.say('|       LET THE GAME START             |')
Console.say('|                                      |')
Console.say(" -------------------------------------- \n\n")

App::Game.new(players_count, max_score).start
