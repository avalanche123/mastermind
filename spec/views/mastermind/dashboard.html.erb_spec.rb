require 'spec_helper'

describe "mastermind/dashboard.html.erb" do
  let(:user) { mock_model(User).as_null_object }

  let(:games) do
    (1..5).map do |id|
      game(id)
    end
  end

  let(:leaders) do
    (1..10).map do |id|
      games_won = [1, rand(10)].max
      games_lost = [1, rand(10)].max
      games_total = games_lost + games_won
      guesses_average = (games_lost * 8 + games_won * rand(8)) / (games_total)

      mock_model(User, {:id => id,
                        :games_won => games_won,
                        :games_lost => games_lost,
                        :average_guess_count => guesses_average}).as_null_object
    end
  end

  before do
    user.stub(:games => games)
    assign(:user, user)
    assign(:leaders, leaders)
    render
  end

  it "displays user's played games" do
    rendered.should contain('My Games')
    rendered.should contain('Number')
    rendered.should contain('Guesses')

    games.each do |game|
      rendered.should contain(game.id.to_s)
      rendered.should contain(game.won? ? 'won' : 'lost')
      rendered.should contain(game.guess_count.to_s)
    end
  end

  it "displays leader board" do
    rendered.should contain('Leader board')
    rendered.should contain('User Id')
    rendered.should contain('Wins')
    rendered.should contain('Loses')
    rendered.should contain('ANG')

    leaders.each do |leader|
      rendered.should contain(leader.id.to_s)
      rendered.should contain(leader.games_won.to_s)
      rendered.should contain(leader.games_lost.to_s)
      rendered.should contain(leader.average_guess_count.to_s)
    end
  end
end

def game(id)
  mock_model(Game, {:id => id,
                    :won => id.even?,
                    :guess_count => (id.even? ? rand(8) : 8)}).as_null_object
end