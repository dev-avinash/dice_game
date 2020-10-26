# frozen_string_literal: true

require 'tty-prompt'
require 'table_print'

# Handel console input and output
class Console
  def self.ask(message, error_mesasge, validate = /^[1-9][0-9]*$/, required: true)
    prompt.ask(message) do |q|
      q.required required
      q.validate validate
      q.messages[:valid?] = "Invalid input, #{error_mesasge}"
    end
  end

  def self.select(message, choice = ['r'])
    prompt.select(message, choice)
  end

  def self.say(message)
    prompt.say(message)
  end

  def self.display_table(players)
    tp players, :name, :total_score, :rank
  end

  def self.prompt
    @prompt ||= TTY::Prompt.new
  end
end
