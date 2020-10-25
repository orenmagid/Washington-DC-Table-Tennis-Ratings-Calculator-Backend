class SessionSerializer < ActiveModel::Serializer
  belongs_to :group, optional: true
  has_many :matches
  has_many :ratings
  attributes :id, :date, :group_id
end
