class SessionSerializer < ActiveModel::Serializer
  has_many :matches
  has_many :ratings
  attributes :id, :date, :winner_id, :loser_id
end
