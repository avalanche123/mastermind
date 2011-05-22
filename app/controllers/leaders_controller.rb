class LeadersController < ::ApplicationController
  def index
    @leaders = User.find_top_ten
  end
end
