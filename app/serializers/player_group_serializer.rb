class PlayerGroupSerializer < ActiveModel::Serializer
  belongs_to :player, optional: true
  belongs_to :group, optional: true
  attributes :id, :player_id, :group_id
end
