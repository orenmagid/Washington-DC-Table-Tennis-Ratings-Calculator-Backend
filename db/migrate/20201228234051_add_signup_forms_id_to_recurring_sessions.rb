class AddSignupFormsIdToRecurringSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :recurring_sessions, :signup_form_id, :integer
  end
end
