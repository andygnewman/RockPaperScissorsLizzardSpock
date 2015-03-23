class Player

  attr_reader :name, :score, :choice

  def initialize(name)
    @name = name
    @score = 0
    @choice = nil
  end

  def set_name(name)
    @name = name
  end

  def add_win_score
    @score += 1
  end

  def set_choice(choice)
    @choice = choice.to_sym
  end

  def choice_string
    choice.to_s
  end

end
