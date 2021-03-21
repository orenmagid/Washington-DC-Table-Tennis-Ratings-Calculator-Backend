class RecurringSession < ApplicationRecord
  has_many :sessions
  has_many :player_intents
  has_many :signup_form_recurring_sessions
  has_many :signup_forms, through: :signup_form_recurring_sessions

  def get_default_date
    today_day_of_week = Date.today.wday

    recurring_session_day_of_week = self.day_of_week

    recurring_session_day_of_week += 7

    default_date = Date.today + (today_day_of_week + recurring_session_day_of_week).day

    return default_date
  end
end
