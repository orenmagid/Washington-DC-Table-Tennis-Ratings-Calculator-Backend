class Rating < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :session, optional: true

  default_scope { order(date: :desc) }
end
