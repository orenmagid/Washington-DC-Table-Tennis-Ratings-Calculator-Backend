class SignupFormRecurringSession < ApplicationRecord
  belongs_to :signup_form
  belongs_to :recurring_session
end
