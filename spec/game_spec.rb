require 'game'

describe Game do

  let(:game) {Game.new}

  it 'should return 3 possible options' do
    expect(game.possible_values).to eq("Rock, Paper, Scissors")
  end
  
  context 'evaluating who won each turn' do

    it 'should tell me it\'s a draw if player and computer choose the same option' do
      allow(game.player1).to receive(:[]).with(:name).and_return("Player 1")
      allow(game.player1).to receive(:[]).with(:score).and_return(0)
      allow(game.player1).to receive(:[]).with(:choice).and_return(:rock)
      allow(game.player2).to receive(:[]).with(:name).and_return("Player 2")
      allow(game.player2).to receive(:[]).with(:score).and_return(0)
      allow(game.player2).to receive(:[]).with(:choice).and_return(:rock)
      expect(game.turn_result[0,12]).to eq("It's a draw!")
    end

    it 'should tell me player 2 wins with Rock, Paper' do
      allow(game.player1).to receive(:[]).with(:name).and_return("Player 1")
      allow(game.player1).to receive(:[]).with(:score).and_return(0)
      allow(game.player1).to receive(:[]).with(:choice).and_return(:rock)
      allow(game.player2).to receive(:[]).with(:name).and_return("Player 2")
      allow(game.player2).to receive(:[]).with(:score).and_return(0)
      allow(game.player2).to receive(:[]).with(:choice).and_return(:paper)
      expect(game.turn_result[0,12]).to eq("Player 2 win")
    end

    it 'should tell me player 1 wins with Scissors, Paper' do
      allow(game.player1).to receive(:[]).with(:name).and_return("Player 1")
      allow(game.player1).to receive(:[]).with(:score).and_return(0)
      allow(game.player1).to receive(:[]).with(:choice).and_return(:scissors)
      allow(game.player2).to receive(:[]).with(:name).and_return("Player 2")
      allow(game.player2).to receive(:[]).with(:score).and_return(0)
      allow(game.player2).to receive(:[]).with(:choice).and_return(:paper)
      expect(game.turn_result[0,12]).to eq("Player 1 win")
    end

  end

  # context 'evaluating the scores'

end