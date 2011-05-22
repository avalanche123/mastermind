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

  describe "GET 'play'" do
    context "when user is logged in" do
      code ||= [0, 1, 1, 0]

      let(:codemaker) { stub(Codemaker, :make => code) }
      let(:user) { mock_model(User).as_null_object }

      before(:each) do
        Codemaker.stub(:new).and_return(codemaker)
        log_in user
      end

      context "when the user finished all previous games" do
        it "lets current user play new game" do
          user.stub(:finished_all_games?).and_return(true)
          user.should_receive(:play).with(code)
          get :play
        end
      end

      context "when the user did not finish all previous games" do
        it "won't let user play new game" do
          user.stub(:finished_all_games?).and_return(false)
          user.should_not_receive(:play)
          get :play
        end
      end

      it "assigns @game to be user's current game" do
        game = mock_model(Game).as_null_object
        user.stub(:current_game).and_return(game)
        get :play
        assigns[:game].should eq(game)
      end
    end

    context "when user is logged out" do
      it "redirects to 'index'" do
        get :play
        response.should redirect_to :action => "new", :controller => "devise/sessions"
      end
    end
  end
end
