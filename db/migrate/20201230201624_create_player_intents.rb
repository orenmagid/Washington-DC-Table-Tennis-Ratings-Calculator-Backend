class CreatePlayerIntents < ActiveRecord::Migration[6.0]
  def change
    create_table :player_intents do |t|
      t.integer :player_id
      t.integer :recurring_session_id
      t.integer :signup_form_id
      t.timestamps
    end
  end
end
