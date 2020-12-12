class SessionSerializer < ActiveModel::Serializer
  belongs_to :recurring_session, optional: true
  has_many :matches
  has_many :ratings
  attributes :id, :date, :recurring_session_id
end
