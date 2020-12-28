class PlayerSerializer < ActiveModel::Serializer
  has_many :player_matches
  has_many :matches, through: :player_matches
  has_many :ratings
  attributes :id, :name, :email, :username, :admin, :hide
end
