require 'active_support/all'

class Game

  attr_accessor :players

  def initialize
    @rules = {rock: :scissors, paper: :rock, scissors: :paper}
    @players = [{name: "Player 1", score: 0, choice: nil}, {name: "Computer", score:0, choice: nil }]
  end

  def possible_values
    @rules.keys.map(&:to_s).map(&:capitalize).join(", ").to_s
  end

  def computer_choice
    # players[1][:choice] = :scissors
    players[1][:choice] = @rules.keys.sample
  end

  def choice_display(choice_symbol)
    if choice_symbol == nil
      "Nothing chosen yet"
    else
      choice_symbol.to_s
    end
  end

  def turn_result
    computer_choice if players[1][:name] == "Computer"
    if players[0][:choice] == players[1][:choice]
      "It's a draw! You both chose #{choice_display(players[0][:choice])}"
    elsif players[1][:choice] == @rules[players[0][:choice]]
      players[0][:score] += 1
      "#{players[0][:name]} wins; #{choice_display(players[0][:choice])} beats #{choice_display(players[1][:choice])}!"
    else
      players[1][:score] += 1
      "#{players[1][:name]} wins; #{choice_display(players[1][:choice])} beats #{choice_display(players[0][:choice])}!"
    end
  end

end