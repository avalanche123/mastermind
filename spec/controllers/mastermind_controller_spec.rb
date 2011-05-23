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
      code ||= '0110'

      let(:user) { mock_model(User).as_null_object }

      before(:each) do
        Codemaker.stub_chain(:new, :make).and_return(code)
        log_in user
      end

      context "when the user doesn't have an ongoing game" do
        it "lets current user play new game" do
          user.stub(:current_game).and_return(nil)
          user.should_receive(:play).with(code)
          get :play
        end
      end

      context "when the user has unfinished game" do
        it "won't let user play new game" do
          user.stub(:current_game).and_return(Game.new)
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

    context "when user is not logged in" do
      it "redirects to 'index'" do
        get :play
        response.should redirect_to :action => "new", :controller => "devise/sessions"
      end
    end
  end

  describe "POST 'guess'" do
    context "when user is logged in" do
      guess ||= {"0" => "0", "1" => "0", "2" => "0", "3" => "0"}

      let(:game) { mock_model(Game).as_null_object }
      let(:user) { mock_model(User).as_null_object }

      before(:each) do
        user.stub(:current_game).and_return(game)
        log_in user
      end

      it "redirects to 'play'" do
        post :guess, :guess => guess
        response.should render_template("play")
      end

      it "submits a guess to the current game" do
        game.should_receive(:guess).with("0000")
        post :guess, :guess => guess
      end

      it "assigns @game to be user's current game" do
        user.stub(:current_game).and_return(game)
        post :guess, :guess => guess
        assigns[:game].should eq(game)
      end

      it "assigns generated guess to @guess" do
        assigned = Guess.new
        game.stub(:guess).and_return(assigned)
        post :guess, :guess => guess
        assigns[:guess].should eq(assigned)
      end
    end

    context "when user is not logged in" do
      it "redirects to 'index'" do
        get :play
        response.should redirect_to :action => "new", :controller => "devise/sessions"
      end
    end
  end
end
