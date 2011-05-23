class Game < ActiveRecord::Base
  attr_accessible :code, :won, :finished

  belongs_to :user, :autosave => true
  has_many :guesses, :dependent => :destroy, :autosave => true, :after_add => Proc.new { |game|
    game.user.guesses_count = game.user.guesses_count + 1
    game.guesses_count = game.guesses_count + 1
  }

  before_save :finish, :if => Proc.new { |game| game.guesses.count >= 8 }

  def guess(suggested)
    matches = Codebreaker.new(code).guess(suggested)
    if matches == code.size
      self.won = true
      finish 
    end
    guess = self.guesses.create! :code => suggested, :matches => matches
    save!
    guess
  end

  private

  def finish
    self.finished = true
    if self.won?
      self.user.games_won = self.user.games_won + 1
    else
      self.user.games_lost = self.user.games_lost + 1
    end
  end
end
