class Match < ApplicationRecord
  belongs_to :session, optional: true
  has_many :player_matches
  has_many :players, through: :player_matches
end
