class AddRatingChangeToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :rating_change, :integer
  end
end
