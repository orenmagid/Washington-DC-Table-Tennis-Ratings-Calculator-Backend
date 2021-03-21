class AddStageIdToSignupForms < ActiveRecord::Migration[6.0]
  def change
    add_column :signup_forms, :stage_id, :integer
  end
end
