require 'spec_helper'

describe MastermindController do
  include Devise::TestHelpers

  describe "GET 'index'" do
    context "new user" do
      it "renders anonymous home page" do
        get :index
        response.should render_template("index")
      end
    end

    context "authenticated user" do
      let (:user) { mock_model(User).as_null_object }

      before(:each) do
        authenticate user
      end

      it "renders logged in home page" do
        get :index
        response.should render_template("dashboard")
      end
    end
  end
end

def authenticate(user)
  # mock up an authentication in the underlying warden library
  request.env['warden'] = mock(Warden, :authenticate => user,
                                       :authenticate! => user)
end