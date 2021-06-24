# == Schema Information
#
# Table name: player_matches
#
#  id         :bigint           not null, primary key
#  player_id  :integer
#  match_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PlayerMatchSerializer < ActiveModel::Serializer
  belongs_to :player, optional: true
  belongs_to :match, optional: true
  attributes :id, :player_id, :match_id
end
