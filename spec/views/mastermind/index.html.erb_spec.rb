require 'spec_helper'

describe "mastermind/index.html.erb" do
  it "displays static home page" do
    render
    rendered.should contain("Welcome to Mastermind")
    rendered.should contain("log in")
    rendered.should contain("register")
  end
end
