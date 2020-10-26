class PlayerMatchSerializer < ActiveModel::Serializer
  belongs_to :player, optional: true
  belongs_to :match, optional: true
  attributes :id, :player_id, :match_id
end
