require 'sinatra/base'
require_relative 'game'

class Rps < Sinatra::Base
  
  enable :sessions

  GAME = Game.new

  get '/new_game' do
    GAME.reset_game
    erb :index
  end

  get '/?:error?' do
    if params[:player_1_name]
      GAME.player1[:name] = session[:player_1_name] = params[:player_1_name]
      GAME.player2[:name] = session[:player_2_name] = params[:player_2_name] if params[:player_2_name] && (params[:play_against_the_computer] == nil)
      session[:current_turn] = GAME.player1[:name]
    end
    if params[:choice]
      begin
        GAME.enter_choice(session[:current_turn], params[:choice])
      rescue => error
        session[:error] = error.to_s
        redirect '/error'
      end
      if (session[:current_turn] == session[:player_1_name]) && (session[:player_2_name] == "Computer")
        @result = GAME.turn_result
      elsif (session[:current_turn] == session[:player_1_name]) && (session[:player_2_name] != "Computer")
        session[:current_turn] = session[:player_2_name]
        redirect '/'
      else
        @result = GAME.turn_result
      end
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
