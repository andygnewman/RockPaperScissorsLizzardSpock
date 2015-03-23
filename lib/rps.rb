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
      begin
        GAME.enter_names(params[:player_1_name], params[:player_2_name],
        params[:play_against_the_computer])
      rescue => error
        session[:error] = error.to_s
        redirect '/error'
      end
    end
    @error = session[:error] if params[:error]
    @current_turn = GAME.curr_plyr_name
    @p1_name, @p2_name = GAME.player1.name, GAME.player2.name
    @p1_score, @p2_score = GAME.player1.score, GAME.player2.score
    erb :index
  end

  post '/?:error?' do
    GAME.enter_choice(GAME.curr_plyr_name, params[:choice])
    if GAME.player2.name == "Computer"
      @result = GAME.run_result
    elsif GAME.curr_plyr_name == GAME.player1.name
      GAME.switch_players
      redirect '/'
    else
      @result = GAME.run_result
      GAME.switch_players
    end
    @current_turn = GAME.curr_plyr_name
    @p1_name, @p2_name = GAME.player1.name, GAME.player2.name
    @p1_choice = GAME.choice_str(GAME.player1)
    @p2_choice = GAME.choice_str(GAME.player2)
    @p1_score, @p2_score = GAME.player1.score, GAME.player2.score
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
