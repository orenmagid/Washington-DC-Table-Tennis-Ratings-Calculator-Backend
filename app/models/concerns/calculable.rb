module Calculable
  extend ActiveSupport::Concern

  included do
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

    def calculate_ratings(session_winner_id, session_loser_id)
      ratings_change_hash = {}

      ratings_change_hash[session_winner_id] = 40 if session_winner_id
      ratings_change_hash[session_loser_id] = -40 if session_loser_id


      self.matches.each do |match|
        if !match.winner_id.blank?
          winner = match.players.find { |player| player.id == match.winner_id }
          loser = match.players.find { |player| player.id != match.winner_id }

          winner_rating = winner.ratings.last.value
          loser_rating = loser.ratings.last.value

          rating_difference = winner_rating - loser_rating

          if rating_difference >= 0
            if rating_difference <= 12
              change = 8
            elsif rating_difference >= 13 && rating_difference <= 37
              change = 7
            elsif rating_difference >= 38 && rating_difference <= 62
              change = 6
            elsif rating_difference >= 63 && rating_difference <= 87
              change = 5
            elsif rating_difference >= 88 && rating_difference <= 112
              change = 4
            elsif rating_difference >= 113 && rating_difference <= 137
              change = 3
            elsif rating_difference >= 138 && rating_difference <= 162
              change = 2
            elsif rating_difference >= 163 && rating_difference <= 187
              change = 2
            elsif rating_difference >= 188 && rating_difference <= 212
              change = 1
            elsif rating_difference >= 213 && rating_difference <= 237
              change = 1
            elsif rating_difference >= 238
              change = 0
            end
          elsif rating_difference < 0
            if rating_difference >= -12
              change = 8
            elsif rating_difference <= -13 && rating_difference >= -37
              change = 10
            elsif rating_difference <= -38 && rating_difference >= -62
              change = 13
            elsif rating_difference <= -63 && rating_difference >= -87
              change = 16
            elsif rating_difference <= -88 && rating_difference >= -112
              change = 20
            elsif rating_difference <= -113 && rating_difference >= -137
              change = 25
            elsif rating_difference <= -138 && rating_difference >= -162
              change = 30
            elsif rating_difference <= -163 && rating_difference >= -187
              change = 35
            elsif rating_difference <= -188 && rating_difference >= -212
              change = 40
            elsif rating_difference <= -213 && rating_difference >= -237
              change = 45
            elsif rating_difference <= -238
              change = 50
            end
          end

          Match.find(match.id).update(rating_change: change)
          ratings_change_hash[winner.id] = ratings_change_hash[winner.id] ? ratings_change_hash[winner.id] + change : change
          ratings_change_hash[loser.id] = ratings_change_hash[loser.id] ? ratings_change_hash[loser.id] - change : change
        end
      end

      ratings_change_hash.each do |player_id, change|
        player = Player.find(player_id)
        rating_value = player.ratings.last.value + change
        new_rating = Rating.create(value: rating_value, session_id: self.id)
        player.ratings.push(new_rating)
        player.update(most_recent_rating: rating_value, participated: true)
      end
    end
  end
end