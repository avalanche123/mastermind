class MastermindController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]

  def index
    render :action => "dashboard" if user_signed_in?
  end

  def dashboard
  end
end