class Group < ApplicationRecord
  has_many :player_groups
  has_many :players, through: :player_groups
  has_many :sessions

  def log_ratings()
    self.players.sort { |a, b| a.ratings.last.value <=> b.ratings.last.value }.each do |player|
      puts("#{player.name}: #{player.ratings.last.value}")
    end
  end
end
