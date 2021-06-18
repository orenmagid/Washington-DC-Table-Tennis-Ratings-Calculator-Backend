class Session < ApplicationRecord
  belongs_to :group, optional: true
  has_many :matches, -> { order(created_at: :asc) }
  has_many :ratings

  default_scope { order(date: :asc) }
  scope :from_most_recent, -> { reorder(date: :desc) }

  def self.recalculate_ratings(starting_session_id)
    sessions_to_recalculate = Session.where('id >= ?', starting_session_id).order(date: :asc, created_at: :asc)

    sessions_to_recalculate.each do |session|
      session.ratings.destroy_all
      session.matches.each { |match| match.update(rating_change: nil)}
    end 

    sessions_to_recalculate.each do |session|
      session.reload
      session.calculate_ratings
    end
  end

  def calculate_ratings(ratings_hash = {}, first_pass = true)
    if ratings_hash.keys.length > 0
      adjustment_hash = ratings_hash.map do |player_id, rating_value|
        player = Player.find { |p| p.id == player_id }
        [player_id, rating_value - player.ratings.last.value]
      end.to_h
    else
      adjustment_hash = {}
    end

    self.matches.each do |match|
      if !match.winner_id.blank?
        winner = match.players.find { |player| player.id == match.winner_id }
        loser = match.players.find { |player| player.id != match.winner_id }

        winner_rating = ratings_hash[winner.id] ? ratings_hash[winner.id] : winner.ratings.last.value
        loser_rating = ratings_hash[loser.id] ? ratings_hash[loser.id] : loser.ratings.last.value

        rating_difference = winner_rating - loser_rating

        if rating_difference >= 0
          if rating_difference <= 12
            change = 8
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 13 && rating_difference <= 37
            change = 7
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 38 && rating_difference <= 62
            change = 6
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 63 && rating_difference <= 87
            change = 5
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 88 && rating_difference <= 112
            change = 4
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 113 && rating_difference <= 137
            change = 3
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 138 && rating_difference <= 162
            change = 2
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 163 && rating_difference <= 187
            change = 2
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 188 && rating_difference <= 212
            change = 1
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 213 && rating_difference <= 237
            change = 1
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference >= 238
            new_winner_value = winner_rating
            new_loser_value = loser_rating
          end
        elsif rating_difference < 0
          if rating_difference >= -12
            change = 8
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -13 && rating_difference >= -37
            change = 10
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -38 && rating_difference >= -62
            change = 13
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -63 && rating_difference >= -87
            change = 16
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -88 && rating_difference >= -112
            change = 20
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -113 && rating_difference >= -137
            change = 25
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -138 && rating_difference >= -162
            change = 30
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -163 && rating_difference >= -187
            change = 35
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -188 && rating_difference >= -212
            change = 40
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -213 && rating_difference >= -237
            change = 45
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          elsif rating_difference <= -238
            change = 50
            new_winner_value = winner_rating + change
            new_loser_value = loser_rating - change
          end
        end

        Match.find(match.id).update(rating_change: change)
        ratings_hash[winner.id] = new_winner_value
        ratings_hash[loser.id] = new_loser_value
      end
    end

    first_tier_adjusted_ratings_hash = ratings_hash.select do |player_id, rating_value|
      player = Player.find { |p| p.id == player_id }
      rating_change = rating_value - player.ratings.last.value
      should_be_adjusted_up = rating_change >= 50
    end

    if first_tier_adjusted_ratings_hash.keys.length > 0 && first_pass
      self.calculate_ratings(first_tier_adjusted_ratings_hash, false)
    else
      ratings_hash.each do |player_id, rating_value|
        new_rating = Rating.create(value: rating_value, session_id: self.id, adjustment: adjustment_hash[player_id] ? adjustment_hash[player_id] : nil)
        player = Player.find { |p| p.id == player_id }
        player.ratings.push(new_rating)
        player.update(most_recent_rating: rating_value, participated: true)
      end
    end
  end

  def log_ratings()
    self.ratings.sort { |a, b| a.value <=> b.value }.each do |rating|
      player = Player.find { |p| p.id == rating.player_id }
      puts("#{player.name}: #{rating.value} #{rating.adjustment ? "(adjusted: " + rating.adjustment.to_s + ")" : nil}")
    end
  end
end
