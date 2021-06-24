# == Schema Information
#
# Table name: players
#
#  id                 :bigint           not null, primary key
#  name               :string
#  email              :string
#  username           :string
#  password_digest    :string
#  admin              :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  hide               :boolean          default(FALSE)
#  most_recent_rating :integer
#  participated       :boolean          default(FALSE)
#
class PlayerSerializer < ActiveModel::Serializer
  has_many :player_matches
  has_many :matches, through: :player_matches
  has_many :ratings
  attributes :id, :name, :email, :username, :admin, :hide, :most_recent_rating, :participated
end
