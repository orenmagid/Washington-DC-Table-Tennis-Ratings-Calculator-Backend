class Player < ApplicationRecord
  has_many :player_groups
  has_many :groups, through: :player_groups
  has_many :player_matches
  has_many :matches, through: :player_matches
  has_many :ratings

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  def log_all_ratings()
    Player.all.sort { |a, b| a.ratings.last.value <=> b.ratings.last.value }.each do |player|
      puts("#{player.name}: #{player.ratings.last.value}")
    end
  end

  def self.create_with_rating_and_group(name:, email:, rating:, group_id: nil, admin:, username:, password:)
    player = Player.create(name: name, email: email, admin: admin, username: username, password: password)
    if group_id
      group = Group.find(group_id)
      group.players.push(player)
    end
    player_rating = Rating.create(value: rating, player_id: player.id, session_id: nil)
    player.ratings.push(player_rating)
    return player
  end
end
