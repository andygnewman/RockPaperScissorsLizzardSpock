require 'sinatra/base'
require_relative 'game'

class Rps < Sinatra::Base
  
  GAME = Game.new

  get '/' do
    GAME.players[0][:name] = params[:p1_name] if params[:p1_name]
    if params[:choice]
      GAME.players[0][:choice] = params[:choice].downcase.to_sym
      @result = GAME.turn_result
      @choice = params[:choice]
    else
      @result =nil
    end
    @p1_name, @p2_name = GAME.players[0][:name], GAME.players[1][:name]
    @p1_choice, @p2_choice = GAME.choice_display(GAME.players[0][:choice]), GAME.choice_display(GAME.players[1][:choice])
    @p1_score, @p2_score = GAME.players[0][:score], GAME.players[0][:score]
    erb :index 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
