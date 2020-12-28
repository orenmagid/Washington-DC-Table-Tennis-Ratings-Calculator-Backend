class ChangeGroupIdToRecurringSessionId < ActiveRecord::Migration[6.0]
  def change
    rename_column :sessions, :group_id, :recurring_session_id
  end
end
