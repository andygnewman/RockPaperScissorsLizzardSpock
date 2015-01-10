require 'sinatra/base'
require_relative 'game'

class Rps < Sinatra::Base
  
  enable :sessions

  GAME = Game.new

  get '/?:error?' do
    session[:player_name] = GAME.players[0][:name] = params[:p1_name] if params[:p1_name]
    if params[:choice]
      begin
        GAME.enter_choice(session[:player_name], params[:choice])
      rescue => error
        session[:error] = error.to_s
        redirect '/error'
      end
      @result = GAME.turn_result
      @choice = params[:choice]
    else
      @result =nil
    end
    @error = session[:error] if params[:error]
    @p1_name, @p2_name = GAME.player1[:name], GAME.player2[:name]
    @p1_choice, @p2_choice = GAME.choice_display(GAME.player1[:choice]), GAME.choice_display(GAME.player2[:choice])
    @p1_score, @p2_score = GAME.player1[:score], GAME.player2[:score]
    erb :index 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
