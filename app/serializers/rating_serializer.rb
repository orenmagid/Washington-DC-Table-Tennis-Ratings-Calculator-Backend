# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  value      :integer
#  adjustment :integer
#  player_id  :integer
#  session_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RatingSerializer < ActiveModel::Serializer
  belongs_to :player
  belongs_to :session
  attributes :id, :value, :adjustment, :player_id, :session_id
end
