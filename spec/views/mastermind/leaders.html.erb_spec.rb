require 'spec_helper'

describe "mastermind/leaders.html.erb" do
  let(:leaders) do
    (1..10).map do |id|
      games_won = [1, rand(10)].max
      games_lost = [1, rand(10)].max
      games_total = games_lost + games_won
      guesses_average = (games_lost * 8 + games_won * rand(8)) / (games_total)

      mock_model(User, {:email => "user#{id}@example.com",
                        :games_won => games_won,
                        :games_lost => games_lost,
                        :guesses_count_average => guesses_average}).as_null_object
    end
  end

  it "displays leader board" do
    assign(:leaders, leaders)
    render

    rendered.should contain('Leader board')
    rendered.should contain('Email')
    rendered.should contain('Wins')
    rendered.should contain('Loses')
    rendered.should contain('ANG')

    leaders.each do |leader|
      rendered.should contain(leader.email)
      rendered.should contain(leader.games_won.to_s)
      rendered.should contain(leader.games_lost.to_s)
      rendered.should contain(leader.guesses_count_average.to_s)
    end
  end
end
