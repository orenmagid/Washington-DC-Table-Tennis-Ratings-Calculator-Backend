# == Schema Information
#
# Table name: matches
#
#  id            :bigint           not null, primary key
#  session_id    :integer
#  winner_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rating_change :integer
#
class MatchSerializer < ActiveModel::Serializer
  belongs_to :session, optional: true
  has_many :player_matches
  has_many :players, through: :player_matches
  attributes :id, :session_id, :winner_id, :rating_change
end
