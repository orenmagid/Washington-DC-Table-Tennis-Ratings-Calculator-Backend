class AddMostRecentRatingToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :most_recent_rating, :integer
  end
end
