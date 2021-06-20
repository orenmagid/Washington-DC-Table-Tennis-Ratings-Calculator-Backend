class Player < ApplicationRecord
  has_many :player_matches
  has_many :matches, through: :player_matches
  has_many :ratings, -> { order(created_at: :asc) }

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  def log_all_ratings
    Player.all.sort { |a, b| a.ratings.last.value <=> b.ratings.last.value }.each do |player|
      puts("#{player.name}: #{player.ratings.last.value}")
    end
  end

  def self.add_most_recent_rating_to_player
    Player.all.each do |player|
      player.update(most_recent_rating: player.ratings.last.value)
    end
  end

  def self.create_with_rating(name:, email: nil, rating: nil, admin: false, username: nil, password: nil)
    player = Player.create(name: name, email: email, admin: admin, username: username, password: password, most_recent_rating: rating)
    player_rating = Rating.create(value: rating, player_id: player.id, session_id: nil)
    player.ratings.push(player_rating)
    return player
  end
end
