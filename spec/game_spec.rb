require 'game'

describe Game do

  let(:game) {Game.new}

  it 'should return 3 possible options' do
    expect(game.possible_values).to eq("Rock, Paper, Scissors")
  end
  
  it 'should tell me it\'s a draw if player and computer choose the same option' do
    allow(game).to receive(:player_choice).and_return(:rock)
    allow(game).to receive(:computer_choice).and_return(:rock)
    expect(game.turn_result(game.player_choice, game.computer_choice)[0,12]).to eq("It's a draw!")
  end

  it 'should tell me player 2 wins with Rock, Paper' do
    allow(game).to receive(:player_choice).and_return(:rock)
    allow(game).to receive(:computer_choice).and_return(:paper)
    expect(game.turn_result(game.player_choice, game.computer_choice)[0,12]).to eq("Player 2 win")
  end

  it 'should tell me player 1 wins with Scissors, Paper' do
    allow(game).to receive(:player_choice).and_return(:scissors)
    allow(game).to receive(:computer_choice).and_return(:paper)
    expect(game.turn_result(game.player_choice, game.computer_choice)[0,12]).to eq("Player 1 win")
  end

end