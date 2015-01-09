require 'active_support/all'

class Game

  attr_accessor :player_choice, :player_1_score, :player_2_score

  def initialize
    @rules = {rock: :scissors, paper: :rock, scissors: :paper}
    @player_choice = 'You haven\'t chosen anything yet'
    @player_1_score = 0
    @player_2_score = 0
  end

  def possible_values
    @rules.keys.map(&:to_s).map(&:capitalize).join(", ").to_s
  end

  def computer_choice
    :scissors
    # @rules.keys.sample
  end

  def turn_result(player_1_choice = @player_choice, player_2_choice = computer_choice)
    if player_1_choice == player_2_choice
      "It's a draw! You both chose #{player_1_choice.to_s.capitalize}"
    elsif player_2_choice == @rules[player_1_choice]
      @player_1_score += 1
      "Player 1 wins; #{player_1_choice.to_s.capitalize} beats #{player_2_choice.to_s.capitalize}"
    else
      @player_2_score += 1
      "Player 2 wins; #{player_2_choice.to_s.capitalize} beats #{player_1_choice.to_s.capitalize}"
    end
  end

end