class Player < ApplicationRecord
  has_many :player_groups
  has_many :groups, through: :player_groups
  has_many :player_matches
  has_many :matches, through: :player_matches
  has_many :ratings

  def log_ratings()
    Player.all.sort { |a, b| a.ratings.last.value <=> b.ratings.last.value }.each do |player|
      puts("#{player.name}: #{player.ratings.last.value}")
    end
  end
end
