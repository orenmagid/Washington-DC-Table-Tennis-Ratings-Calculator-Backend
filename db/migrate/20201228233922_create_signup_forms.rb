class CreateSignupForms < ActiveRecord::Migration[6.0]
  def change
    create_table :signup_forms do |t|
      t.timestamps
    end
  end
end
