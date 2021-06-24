# == Schema Information
#
# Table name: matches
#
#  id            :bigint           not null, primary key
#  session_id    :integer
#  winner_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rating_change :integer
#
class Match < ApplicationRecord
  belongs_to :session, optional: true
  has_many :player_matches
  has_many :players, through: :player_matches

  def self.create_match(winner_id, loser_id, session_id)
    match = Match.create(session_id: session_id)
    winner = Player.find(winner_id)
    loser = Player.find(loser_id)
    match.players.push(winner, loser)
    match.winner_id = winner_id
    match.save
  end
end
