class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :games_won, :games_lost, :games_count, :guesses_count

  has_many :games, :dependent => :destroy, :autosave => true, :after_add => Proc.new { |user| user.games_count = user.games_count + 1 }
  has_one :current_game, :class_name => Game.name, :conditions => "finished = 'f'"

  def play(code)
    games.create! :code => code
  end

  def guesses_count_average
    (self.guesses_count.to_f / self.read_attribute(:games_count).to_f).round(2)
  end

  class << self
    def find_top_ten
      order('games_won DESC, games_lost ASC, guesses_count ASC').limit(10)
    end
  end
end
