class GamesController < ApplicationController
  before_filter :authenticate_user!

  def create
    current_user.play
  end

  def show
  end
end
