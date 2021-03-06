require 'active_support/all'
require_relative 'player'
require_relative 'rules'

class Game

  # attr_accessor :player1, :player2
  attr_reader :players, :rules, :player1, :player2, :curr_plyr_name

  def initialize
    @rules = Rules.new
    @players = [@player1 = Player.new("Player 1"),
                @player2 = Player.new("Computer")]
  end

  def enter_names(player_1_name, player_2_name, play_against_the_computer)
    player_2_as_computer = computer_opponent(play_against_the_computer)
    raise 'You must enter a name for Player 1' if player_1_name == ''
    raise 'You must enter a name for Player 2' if player_2_name == '' &&
      player_2_as_computer == false
    set_player_name(@player1, player_1_name)
    set_player_name(@player2, player_2_name) if player_2_as_computer == false
    @curr_plyr_name = player1.name
  end

  def enter_choice(player_name, choice)
    player = @players.select{ |p| p.name == player_name}.first
    player.set_choice(choice)
  end

  def run_result
    computer_choice if player2.name == "Computer"
    result = rules.turn_result(player1.choice, player2.choice)
    scores(result)
    result_text(result)
  end

  def choice_str(player)
    player.choice_string
  end

  def switch_players
    @curr_plyr_name = players.reject{ |p| p.name == curr_plyr_name}.first.name
  end

  def possible_values_array
    rules.rules_hash.keys.map(&:to_s)
  end

  def possible_values_display
    possible_values_array.map(&:capitalize).join(", ").to_s
  end

  def reset_game
    @players = [@player1 = Player.new("Player 1"),
                @player2 = Player.new("Computer")]
  end

  private

  def computer_choice
    player2.set_choice(rules.random_sample)
  end

  def set_player_name(player, player_name)
    player.set_name(player_name)
  end

  def computer_opponent(play_against_the_computer)
    play_against_the_computer == "on" ? true : false
  end

  def scores(result)
    if result[:player1] != :draw
      winning_player = result[:player1] == :win ? player1 : player2
      winning_player.add_win_score
    end
  end

  def result_text(result)
    case result[:player1]
    when :draw
      "It's a draw! You both chose #{choice_str(player1)}"
    when :win
      "#{player1.name} wins; #{choice_str(player1)} beats #{choice_str(player2)}!"
    else
      "#{player2.name} wins; #{choice_str(player2)} beats #{choice_str(player1)}!"
    end
  end

end
