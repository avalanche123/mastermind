require 'spec_helper'

describe LeadersController do
  describe "GET 'index'" do
    leaders ||= []

    before(:each) do
      User.stub(:find_top_ten).and_return(leaders)
      get :index
    end

    it "assigns @leaders" do
      assigns[:leaders].should eq(leaders)
    end

    it "renders 'index'" do
      response.should render_template("index")
    end
  end
end