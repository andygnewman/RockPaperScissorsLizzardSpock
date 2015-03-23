require 'active_support/all'

class Game

  # attr_accessor :player1, :player2
  attr_reader :players, :rules, :player1, :player2, :curr_plyr_name

  def initialize
    @rules = {rock: [:scissors, :lizzard], paper: [:rock, :spock],
      scissors: [:paper, :lizzard], lizzard: [:spock, :paper],
      spock: [:scissors, :rock]}
    @players = [@player1 = {name: "Player 1", score: 0, choice: nil},
      @player2 = {name: "Computer", score:0, choice: nil }]
  end

  def enter_names(player_1_name, player_2_name, play_against_the_computer)
    player_2_as_computer = computer_opponent(play_against_the_computer)
    raise 'You must enter a name for Player 1' if player_1_name == ''
    raise 'You must enter a name for Player 2' if player_2_name == '' &&
      player_2_as_computer == false
    set_player_name(@player1, player_1_name)
    set_player_name(@player2, player_2_name) if player_2_as_computer == false
    @curr_plyr_name = player1[:name]
  end

  def enter_choice(player_name, choice)
    player_object = @players.select{ |p| p[:name] == player_name}.first
    player_object[:choice] = choice.to_sym
  end

  def turn_result
    computer_choice if player2[:name] == "Computer"
    if player1[:choice] == player2[:choice]
      "It's a draw! You both chose #{choice_display(player1[:choice])}"
    elsif @rules[player1[:choice]].include?(player2[:choice])
      player1[:score] += 1
      "#{player1[:name]} wins; #{choice_display(player1[:choice])} beats
        #{choice_display(player2[:choice])}!"
    else
      player2[:score] += 1
      "#{player2[:name]} wins; #{choice_display(player2[:choice])} beats
        #{choice_display(player1[:choice])}!"
    end
  end

  def choice_display(choice_symbol)
    if choice_symbol == nil
      "Nothing chosen yet"
    else
      choice_symbol.to_s
    end
  end

  def switch_players
    @curr_plyr_name = players.reject{ |p| p[:name] == curr_plyr_name}.first[:name]
  end

  def possible_values_array
    @rules.keys.map(&:to_s)
  end

  def possible_values_display
    @rules.keys.map(&:to_s).map(&:capitalize).join(", ").to_s
  end

  def reset_game
    @players = [@player1 = {name: "Player 1", score: 0, choice: nil},
      @player2 = {name: "Computer", score:0, choice: nil }]
  end

  private

  def computer_choice
    player2[:choice] = @rules.keys.sample
  end

  def set_player_name(player, player_name)
    player[:name] = player_name
  end

  def computer_opponent(play_against_the_computer)
    play_against_the_computer == "on" ? true : false
  end

end
