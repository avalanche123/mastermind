class MastermindController < ApplicationController
  before_filter :authenticate_user!, :only => [:play]
  before_filter :initialize_codemaker, :only => :play

  def index
    if user_signed_in?
      @user = current_user
      render :action => "dashboard"
    end
  end

  def play
    current_user.play(@codemaker.make) if current_user.finished_all_games?
    @game = current_user.current_game
  end

  private

  def initialize_codemaker
    @codemaker = Codemaker.new(4, 2)
  end
end