require 'game'

describe Game do

  let(:game) {Game.new}

  context 'setting up player names' do

    it 'should raise an error if player 1 name is blank' do
      expect{game.enter_names("","Computer",true)}.to raise_error('You must enter a name for Player 1')
    end

    it 'should raise an error if player 2 name is blank and not playing against computer' do
      expect{game.enter_names("Andy","",false)}.to raise_error('You must enter a name for Player 2')
    end

  end


  context 'offering the options' do

    it 'should return 5 possible options' do
      expect(game.possible_values_display).to eq("Rock, Paper, Scissors, Lizzard, Spock")
    end

  end

  context 'evaluating who won each turn and the scores' do

    before(:each) do
      game.enter_names("Player 1", "Player 2", "off")
    end

    it 'should tell me it\'s a draw if player and computer choose the same option' do
      game.enter_choice("Player 1", "rock")
      game.enter_choice("Player 2", "rock")
      expect(game.turn_result[0,12]).to eq("It's a draw!")
      expect(game.player1[:score]).to eq(0)
      expect(game.player2[:score]).to eq(0)
    end

    it 'should tell me player 2 wins with Rock, Paper' do
      game.enter_choice("Player 1", "rock")
      game.enter_choice("Player 2", "paper")
      expect(game.turn_result[0,12]).to eq("Player 2 win")
      expect(game.player1[:score]).to eq(0)
      expect(game.player2[:score]).to eq(1)

    end

    it 'should tell me player 1 wins with Scissors, Paper' do
      game.enter_choice("Player 1", "scissors")
      game.enter_choice("Player 2", "paper")
      expect(game.turn_result[0,12]).to eq("Player 1 win")
      expect(game.player1[:score]).to eq(1)
      expect(game.player2[:score]).to eq(0)
    end

    it 'should tell me player 2 wins with Spock, Lizzard' do
      game.enter_choice("Player 1", "spock")
      game.enter_choice("Player 2", "lizzard")
      expect(game.turn_result[0,12]).to eq("Player 2 win")
      expect(game.player1[:score]).to eq(0)
      expect(game.player2[:score]).to eq(1)
    end

  end

end
