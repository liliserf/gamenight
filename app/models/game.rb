class Game < ActiveRecord::Base

  validates :name, presence: true
  validates :min_players, presence: true
  validates :min_players, numericality: { greater_than_or_equal_to: 1,  }
  validates :max_players, presence: true
  validates :max_players, numericality: { less_than_or_equal_to: 15 }
  validates :user, presence: true
  validates :available?, inclusion: { in: [true, false] }
  validates :available?, exclusion: { in: [nil] }

  belongs_to :user
end
