require 'spec_helper'

describe User do
  code ||= '1010'

  let(:user) { User.create! :email => 'user@example.com', :password => 'Pa55W0rd', :password_confirmation => 'Pa55W0rd' }

  describe '#play' do
    it 'creates a new game with specified code' do
      game = user.play(code)
      game.code.should eq(code)
    end

    it 'assigns created game to user' do
      game = user.play(code)
      game.user.should eq(user)
    end

    it 'adds new game to User#games' do
      expect { user.play(code) }.to change { user.games.count }.by 1
    end
  end

  describe '#current_game' do
    it 'gets the unfinished game' do
      game = user.play(code)
      user.current_game.should eq(game)
    end
  end
end
