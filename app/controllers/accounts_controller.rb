class AccountsController < ActionController::Base
  def new
    @account = Account.new
  end
end