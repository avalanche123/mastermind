class MastermindController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :initialize_game, :except => :index

  def index
    if user_signed_in?
      @user = current_user
      render :action => "dashboard"
    end
  end

  def play
  end

  def guess
    @guess = @game.guess(request[:guess].values.join)
    render :action => "play"
  end

  private

  def initialize_game
    @game = current_user.current_game || current_user.play(make_code)
  end

  def make_code
    Codemaker.new(Rails.application.config.pegs, Rails.application.config.colors).make
  end
end