class Session < ApplicationRecord
  belongs_to :group, optional: true
  has_many :matches
  has_many :ratings

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
            new_winner_value = winner_rating + 8
            new_loser_value = loser_rating - 8
          elsif rating_difference >= 13 && rating_difference <= 37
            new_winner_value = winner_rating + 7
            new_loser_value = loser_rating - 7
          elsif rating_difference >= 38 && rating_difference <= 62
            new_winner_value = winner_rating + 6
            new_loser_value = loser_rating - 6
          elsif rating_difference >= 63 && rating_difference <= 87
            new_winner_value = winner_rating + 5
            new_loser_value = loser_rating - 5
          elsif rating_difference >= 88 && rating_difference <= 112
            new_winner_value = winner_rating + 4
            new_loser_value = loser_rating - 4
          elsif rating_difference >= 113 && rating_difference <= 137
            new_winner_value = winner_rating + 3
            new_loser_value = loser_rating - 3
          elsif rating_difference >= 138 && rating_difference <= 162
            new_winner_value = winner_rating + 2
            new_loser_value = loser_rating - 2
          elsif rating_difference >= 163 && rating_difference <= 187
            new_winner_value = winner_rating + 2
            new_loser_value = loser_rating - 2
          elsif rating_difference >= 188 && rating_difference <= 212
            new_winner_value = winner_rating + 1
            new_loser_value = loser_rating - 1
          elsif rating_difference >= 213 && rating_difference <= 237
            new_winner_value = winner_rating + 1
            new_loser_value = loser_rating - 1
          elsif rating_difference >= 238
            new_winner_value = winner_rating
            new_loser_value = loser_rating
          end
        elsif rating_difference < 0
          if rating_difference >= -12
            new_winner_value = winner_rating + 8
            new_loser_value = loser_rating - 8
          elsif rating_difference <= -13 && rating_difference >= -37
            new_winner_value = winner_rating + 10
            new_loser_value = loser_rating - 10
          elsif rating_difference <= -38 && rating_difference >= -62
            new_winner_value = winner_rating + 13
            new_loser_value = loser_rating - 13
          elsif rating_difference <= -63 && rating_difference >= -87
            new_winner_value = winner_rating + 16
            new_loser_value = loser_rating - 16
          elsif rating_difference <= -88 && rating_difference >= -112
            new_winner_value = winner_rating + 20
            new_loser_value = loser_rating - 20
          elsif rating_difference <= -113 && rating_difference >= -137
            new_winner_value = winner_rating + 25
            new_loser_value = loser_rating - 25
          elsif rating_difference <= -138 && rating_difference >= -162
            new_winner_value = winner_rating + 30
            new_loser_value = loser_rating - 30
          elsif rating_difference <= -163 && rating_difference >= -187
            new_winner_value = winner_rating + 35
            new_loser_value = loser_rating - 35
          elsif rating_difference <= -188 && rating_difference >= -212
            new_winner_value = winner_rating + 40
            new_loser_value = loser_rating - 40
          elsif rating_difference <= -213 && rating_difference >= -237
            new_winner_value = winner_rating + 45
            new_loser_value = loser_rating - 45
          elsif rating_difference <= -238
            new_winner_value = winner_rating + 50
            new_loser_value = loser_rating - 50
          end
        end

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
