class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :adjustment
      t.integer :player_id
      t.integer :session_id

      t.timestamps
    end
  end
end
