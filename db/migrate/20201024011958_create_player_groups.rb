class CreatePlayerGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :player_groups do |t|
      t.integer :player_id
      t.integer :group_id

      t.timestamps
    end
  end
end
