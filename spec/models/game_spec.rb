require 'spec_helper'

describe Game do
  code ||= '0101'
  let(:game) do
    user = User.create! :email => 'user@example.com', :password => 'Pa55W0rd', :password_confirmation => 'Pa55W0rd'
    user.games.create! :code => code, :finished => false
  end

  describe '#guess' do
    context 'when a wrong suggestion is given' do
      suggested ||= '0000'

      it 'makes a new guess with given suggestion' do
        guess = game.guess(suggested)
        guess.code.should eq(suggested)
      end

      it 'assigns created guess to game' do
        guess = game.guess(suggested)
        guess.game.should eq(game)
      end

      it 'increments user#guesses_count' do
        expect { game.guess(suggested) }.to change { game.user.guesses_count }.by(1)
      end

      context 'when limit of guests is reached' do
        it 'changes status to finished if 8 or more guesses given' do
          expect do
            8.times { game.guess(suggested) }
          end.to change { game.finished }.from(false).to(true)
        end

        it 'increments user#games_lost' do
          expect do
            8.times { game.guess(suggested) }
          end.to change { game.user.games_lost }.by(1)
        end
      end
    end

    context 'when the right suggestion is given' do
      suggested = code

      it 'marks game as won and calls #finish' do
        game.guess(suggested)
        game.won?.should be_true
      end

      it 'finishes the game' do
        game.guess(suggested)
        game.finished?.should be_true
      end

      it 'increments user#games_won' do
        expect { game.guess(suggested) }.to change { game.user.games_won }.by(1)
      end
    end
  end
end
