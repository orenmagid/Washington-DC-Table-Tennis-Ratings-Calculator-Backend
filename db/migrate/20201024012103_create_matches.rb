class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :session_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
