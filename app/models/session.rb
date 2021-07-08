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
class Session < ApplicationRecord
  include Calculable
  include CalculableWithOldMethod

  has_many :matches, dependent: :destroy, -> { order(created_at: :asc) }
  has_many :ratings, dependent: :destroy

  default_scope { order(date: :asc) }
  scope :from_most_recent, -> { reorder(date: :desc) }

  def log_ratings()
    self.ratings.sort { |a, b| a.value <=> b.value }.each do |rating|
      player = Player.find { |p| p.id == rating.player_id }
      puts("#{player.name}: #{rating.value} #{rating.adjustment ? "(adjusted: " + rating.adjustment.to_s + ")" : nil}")
    end
  end
end
