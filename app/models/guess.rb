class Guess < ActiveRecord::Base
  attr_accessible :code, :matches

  belongs_to :game, :autosave => true, :counter_cache => true
end
