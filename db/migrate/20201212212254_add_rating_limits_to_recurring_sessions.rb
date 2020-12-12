class AddRatingLimitsToRecurringSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :recurring_sessions, :low_rating_limit, :integer
    add_column :recurring_sessions, :high_rating_limit, :integer
  end
end
