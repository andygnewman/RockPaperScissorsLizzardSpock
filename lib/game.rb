require 'active_support/all'
require 'player'
require 'rules'

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
    case result[:player1]
    when :draw
      "It's a draw! You both chose #{player1.choice_string}"
    when :win
      player1.add_win_score
      "#{player1.name} wins; #{player1.choice_string} beats
        #{player2.choice_string}!"
    else
      player2.add_win_score
      "#{player2.name} wins; #{player2.choice_string} beats
        #{player1.choice_string}!"
    end
  end

  def choice_display(player)
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

end
