class PlayerIntent < ApplicationRecord
  belongs_to :player
  belongs_to :recurring_session
  belongs_to :signup_form
end
