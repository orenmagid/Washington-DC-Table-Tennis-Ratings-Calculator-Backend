class Group < ApplicationRecord
  has_many :player_groups
  has_many :players, through: :player_groups
  has_many :sessions
end
