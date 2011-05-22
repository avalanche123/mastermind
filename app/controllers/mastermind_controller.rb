class MastermindController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]

  def index
    if user_signed_in?
      @user = current_user
      render :action => "dashboard"
    end
  end
end