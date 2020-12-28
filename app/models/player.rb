class Player < ApplicationRecord
  has_many :player_groups
  has_many :groups, through: :player_groups
  has_many :player_matches
  has_many :matches, through: :player_matches
  has_many :ratings

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  # validate :password_lower_case
  # validate :password_uppercase
  # validate :password_special_char
  # validate :password_contains_number

  def log_all_ratings()
    Player.all.sort { |a, b| a.ratings.last.value <=> b.ratings.last.value }.each do |player|
      puts("#{player.name}: #{player.ratings.last.value}")
    end
  end

  def self.create_with_rating_and_group(name:, email: nil, rating: nil, group_id: nil, admin: false, username: nil, password: nil)
    player = Player.create(name: name, email: email, admin: admin, username: username, password: password)
    if group_id
      group = Group.find(group_id)
      group.players.push(player)
    end
    player_rating = Rating.create(value: rating, player_id: player.id, session_id: nil)
    player.ratings.push(player_rating)
    return player
  end

  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, " must contain at least 1 uppercase "
  end

  def password_lower_case
    return if !!password.match(/\p{Lower}/)
    errors.add :password, " must contain at least 1 lowercase "
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    return if password =~ regex
    errors.add :password, " must contain special character"
  end

  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, " must contain at least one number"
  end
end
