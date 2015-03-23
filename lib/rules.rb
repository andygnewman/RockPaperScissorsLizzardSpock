class Rules

  attr_reader :rules_hash

  def initialize
    @rules_hash = {rock: [:scissors, :lizzard], paper: [:rock, :spock],
      scissors: [:paper, :lizzard], lizzard: [:spock, :paper],
      spock: [:scissors, :rock]}
  end

  def turn_result(player_1_choice, player_2_choice)
    if player_1_choice == player_2_choice
      return {player1: :draw}
    elsif rules_hash[player_1_choice].include?(player_2_choice)
      return {player1: :win}
    else
      return {player1: :lose}
    end
  end

  def random_sample
    rules_hash.keys.sample
  end

end
