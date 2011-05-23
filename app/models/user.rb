class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :games_won, :games_lost, :games_count, :guesses_count

  has_many :games, :dependent => :destroy, :autosave => true
  has_one :current_game, :class_name => Game.name, :conditions => "finished = 'f'"

  def play(code)
    games.create! :code => code
  end

  def guesses_count_average
    
  end

  class << self
    def find_top_ten
      order('games_won DESC, games_lost ASC, guesses_count ASC').limit(10)
    end
  end
end
