class Rating < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :session, optional: true

  # def self.recalculate_all
  #   Player.all.each do |player|
  #     player.update(most_recent_rating: player.ratings.first.value)
  #   end

  #   Session.all.each do |session|
  #     session.ratings.each do |rating|
  #       rating.destroy
  #     end
  #   end

  #   Session.all.each do |session|
  #     session.calculate_ratings
  #   end
  # end
end
