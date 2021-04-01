class MatchSerializer < ActiveModel::Serializer
  belongs_to :session, optional: true
  has_many :player_matches
  has_many :players, through: :player_matches
  attributes :id, :session_id, :winner_id, :rating_change
end
