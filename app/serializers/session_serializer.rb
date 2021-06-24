# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  date       :datetime
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  winner_id  :integer
#  loser_id   :integer
#
class SessionSerializer < ActiveModel::Serializer
  has_many :matches
  has_many :ratings
  attributes :id, :date, :winner_id, :loser_id
end
