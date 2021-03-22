class AddParticipatedToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :participated, :boolean, default: false
  end
end
