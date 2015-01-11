require 'game'

describe Game do

  let(:game) {Game.new}

  context 'offering the options' do

    it 'should return 3 possible options' do
      expect(game.possible_values).to eq("Rock, Paper, Scissors")
    end

    it 'should raise an error if an invalid option is entered' do
      expect{game.enter_choice("Player 1","banana")}.to raise_error('banana is not valid, please choose again')
    end

  end

  
  context 'evaluating who won each turn and the scores' do

    it 'should tell me it\'s a draw if player and computer choose the same option' do
      game.player1[:choice] = :rock
      game.player2[:name] = "Player 2"
      game.player2[:choice] = :rock
      expect(game.turn_result[0,12]).to eq("It's a draw!")
      expect(game.player1[:score]).to eq(0)
      expect(game.player2[:score]).to eq(0)
    end

    it 'should tell me player 2 wins with Rock, Paper' do
      game.player1[:choice] = :rock
      game.player2[:name] = "Player 2"
      game.player2[:choice] = :paper
      expect(game.turn_result[0,12]).to eq("Player 2 win")
      expect(game.player1[:score]).to eq(0)
      expect(game.player2[:score]).to eq(1)

    end

    it 'should tell me player 1 wins with Scissors, Paper' do
      game.player1[:choice] = :scissors
      game.player2[:name] = "Player 2"
      game.player2[:choice] = :paper
      expect(game.turn_result[0,12]).to eq("Player 1 win")
      expect(game.player1[:score]).to eq(1)
      expect(game.player2[:score]).to eq(0)
    end

  end

end