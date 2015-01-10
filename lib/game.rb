require 'active_support/all'

class Game

  attr_accessor :player1, :player2
  attr_reader :players

  def initialize
    @rules = {rock: :scissors, paper: :rock, scissors: :paper}
    @players = [@player1 = {name: "Player 1", score: 0, choice: nil}, @player2 = {name: "Computer", score:0, choice: nil }]
  end

  def possible_values
    @rules.keys.map(&:to_s).map(&:capitalize).join(", ").to_s
  end

  def computer_choice
    player2[:choice] = :scissors
    # player2[:choice] = @rules.keys.sample
  end

  def choice_display(choice_symbol)
    if choice_symbol == nil
      "Nothing chosen yet"
    else
      choice_symbol.to_s
    end
  end

  def turn_result
    computer_choice if player2[:name] == "Computer"
    if player1[:choice] == player2[:choice]
      "It's a draw! You both chose #{choice_display(player1[:choice])}"
    elsif player2[:choice] == @rules[player1[:choice]]
      player1[:score] += 1
      "#{player1[:name]} wins; #{choice_display(player1[:choice])} beats #{choice_display(player2[:choice])}!"
    else
      player2[:score] += 1
      "#{player2[:name]} wins; #{choice_display(player2[:choice])} beats #{choice_display(player1[:choice])}!"
    end
  end

end