class CreateSignupFormRecurringSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :signup_form_recurring_sessions do |t|
      t.integer :recurring_session_id
      t.integer :signup_form_id
      t.timestamps
    end
  end
end
