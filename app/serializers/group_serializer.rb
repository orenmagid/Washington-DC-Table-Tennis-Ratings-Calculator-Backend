class GroupSerializer < ActiveModel::Serializer
  has_many :player_groups
  has_many :players, through: :player_groups
  has_many :sessions
  attributes :id, :name, :day_of_week
end
