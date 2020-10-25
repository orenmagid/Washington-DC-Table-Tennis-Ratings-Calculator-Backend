class RatingSerializer < ActiveModel::Serializer
  belongs_to :player
  belongs_to :session
  attributes :id, :value, :adjustment, :player_id, :session_id
end
