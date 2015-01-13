require 'sinatra/base'
require_relative 'game'

class Rps < Sinatra::Base
  
  enable :sessions

  GAME = Game.new

  get '/new_game' do
    GAME.reset_game
    redirect '/'
  end

  get '/?:error?' do
    if params[:player_1_name]
      params[:play_against_the_computer] == "on" ? player_2_as_computer = true : player_2_as_computer = false
      begin
        GAME.enter_names(params[:player_1_name], params[:player_2_name], player_2_as_computer)
      rescue => error
        session[:error] = error.to_s
        redirect '/error'
      end        
      session[:current_turn] = GAME.player1[:name]
    end
    @error = session[:error] if params[:error]
    @current_turn = session[:current_turn]
    @p1_name, @p2_name = GAME.player1[:name], GAME.player2[:name]
    @p1_score, @p2_score = GAME.player1[:score], GAME.player2[:score]
    erb :index 
  end

  post '/?:error?' do
    GAME.enter_choice(session[:current_turn], params[:choice])
    if GAME.player2[:name] == "Computer"
      @result = GAME.turn_result
      @p1_choice, @p2_choice = GAME.choice_display(GAME.player1[:choice]), GAME.choice_display(GAME.player2[:choice])
    elsif session[:current_turn] == GAME.player1[:name]
      session[:current_turn] = GAME.switch_players(session[:current_turn])
      redirect '/'
    else
      @result = GAME.turn_result
      @p1_choice, @p2_choice = GAME.choice_display(GAME.player1[:choice]), GAME.choice_display(GAME.player2[:choice])
      session[:current_turn] = GAME.switch_players(session[:current_turn])
    end
    @current_turn = session[:current_turn]
    @p1_name, @p2_name = GAME.player1[:name], GAME.player2[:name]
    @p1_score, @p2_score = GAME.player1[:score], GAME.player2[:score]
    erb :index 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
