class SignupForm < ApplicationRecord
  has_many :signup_form_recurring_sessions
  has_many :recurring_sessions, through: :signup_form_recurring_sessions
  has_many :sessions, through: :recurring_sessions
  has_many :player_intents
  belongs_to :stage
end
