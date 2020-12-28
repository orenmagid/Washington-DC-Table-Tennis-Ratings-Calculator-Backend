class AddHideToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :hide, :boolean
  end
end
