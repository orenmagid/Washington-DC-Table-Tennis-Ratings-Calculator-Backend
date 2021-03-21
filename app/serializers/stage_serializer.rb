class StageSerializer < ActiveModel::Serializer
  has_many :signup_forms
  attributes :id, :description
end
