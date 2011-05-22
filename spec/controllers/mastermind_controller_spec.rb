require 'spec_helper'

describe MastermindController do
  describe "GET 'index'" do
    context "when user is not logged in" do
      it "renders anonymous home page" do
        get :index
        response.should render_template("index")
      end
    end

    context "when user is logged in" do
      let(:user) { mock_model(User).as_null_object }

      before(:each) do
        log_in(user)
        get :index
      end

      it "assigns @user" do
        assigns[:user].should eq(user)
      end

      it "renders logged in home page" do
        response.should render_template("dashboard")
      end
    end
  end
end
