class SignupFormSerializer < ActiveModel::Serializer
  has_many :recurring_sessions
  has_many :sessions, through: :recurring_sessions
  has_many :player_intents
  belongs_to :stage
  attributes :id, :active, :stage_id
end
