require 'spec_helper'

describe GamesController do
  let(:user) { mock_model(User).as_null_object }
  before(:each) { log_in user }

  describe "POST 'create'" do
    it "creates a new game" do
      user.should_receive(:play)
      post :create
    end

    it "saves a new game"
  end

  describe "GET 'show'" do
    it "should be successful"
  end

end
