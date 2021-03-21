class AddActiveToSignupForms < ActiveRecord::Migration[6.0]
  def change
    add_column :signup_forms, :active, :boolean
  end
end
