class ChangeGroupsToRecurringSessions < ActiveRecord::Migration[6.0]
  def change
    rename_table :groups, :recurring_sessions
  end
end
