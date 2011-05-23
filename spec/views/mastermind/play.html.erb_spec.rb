require 'spec_helper'

describe "mastermind/play.html.erb" do
  context "when the game is not finished" do
    before do
      assign(:game, Game.new(:finished => false))
    end

    it "lets user submit a guess" do
      render
      rendered.should contain('Enter your guess:')
    end

    context "when user submitted a guess" do
      before do
        assign(:guess, Guess.new(:matches => 2))
      end

      it "displays number of matches" do
        render
        rendered.should contain('You guessed 2 pegs')
      end
    end
  end

  context "when the game is finished" do
    let(:game) { Game.new(:finished => true) }

    before do
      assign(:game, game)
    end

    context "when user won the game" do
      before do
        game.won = true
      end

      it "acknowledges vistory" do
        render
        rendered.should contain('Congratulations, you won!')
      end
    end

    context "when user lost the game" do
      before do
        game.won = false
      end

      it "acknowledges loss" do
        game.code = '1001'
        render
        rendered.should contain('You lost, the code was 1001')
      end
    end

    it 'displays the "play again?" link' do
      render
      rendered.should contain('Play again?')
    end
  end
end
