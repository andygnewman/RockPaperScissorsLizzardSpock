require "player"

describe Player do

  attr_accessor :player

  before(:each) do
    @player = Player.new("Player 1")
  end

  context "setting up a new player" do

    it "should take the name from the parameter passed" do
      expect(player.name).to eq("Player 1")
    end

    it "should have a score of 0" do
      expect(player.score).to eq(0)
    end

    it "should have a choice of nil" do
      expect(player.choice).to be nil
    end

  end

  context "giving the player a new name" do

    it "should be able to have it's name changed" do
      player.set_name("Andy")
      expect(player.name).to eq("Andy")
    end

  end

  context "adding a winning score to a player" do

    it "should add 1 to the score of the player" do
      player.add_win_score
      expect(player.score).to eq(1)
    end

  end

  context "setting the choice for a player" do

    it "should convert the choice parameter to a symbol" do
      player.set_choice("rock")
      expect(player.choice).to eq(:rock)
    end

  end

end
