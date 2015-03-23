require 'rules'

describe Rules do

  attr_reader :rules

  before(:each) do
    @rules = Rules.new
  end

  context "initializing" do

    it "should create a populated rules hash" do
      expect(rules.rules_hash).not_to be_empty
    end

  end

  context "determining the result" do

    it "should determine a draw if choices the same" do
      expect(rules.turn_result(:rock, :rock)).to eq({player1: :draw})
    end

    it "should determine player 1 win if p1 choice beats p2 choice" do
      expect(rules.turn_result(:paper, :spock)).to eq({player1: :win})
    end

    it "should determine player 1 lose if p1 choice beats p2 choice" do
      expect(rules.turn_result(:paper, :scissors)).to eq({player1: :lose})
    end

  end

  context "producing a random sample" do

    it "should be able to return a random sample from the hash values" do
      expect(rules.rules_hash.keys).to include(rules.random_sample)
    end

  end

end
