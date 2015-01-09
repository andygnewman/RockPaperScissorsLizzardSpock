require 'sinatra/base'
require_relative 'game'

class Rps < Sinatra::Base
  
  GAME = Game.new

  get '/' do
    if params[:choice]
      GAME.player_choice = params[:choice].downcase.to_sym
      @result = GAME.turn_result
    else
      @result =nil
      @choice = params[:choice]
    end
    @player_1_score = GAME.player_1_score
    @player_2_score = GAME.player_2_score
    erb :index, locals: {choice: @choice, result: @result, player_1_score: @player_1_score, player_2_score: @player_2_score}
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
