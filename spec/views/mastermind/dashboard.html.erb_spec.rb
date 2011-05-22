require 'spec_helper'

describe "mastermind/dashboard.html.erb" do
  let(:user) { mock_model(User).as_null_object }

  let(:games) do
    (1..5).map do |id|
      game(id)
    end
  end

  before do
    user.stub(:games => games)
    assign(:user, user)
    render
  end

  it "displays user's played games" do
    rendered.should contain('My Games')
    rendered.should contain('Number')
    rendered.should contain('Guesses')

    games.each do |game|
      rendered.should contain(game.id.to_s)
      rendered.should contain(game.won? ? 'won' : 'lost')
      rendered.should contain(game.guesses_count.to_s)
    end
  end
end

def game(id)
  mock_model(Game, {:id => id,
                    :won => id.even?,
                    :guesses_count => (id.even? ? rand(8) : 8)}).as_null_object
end