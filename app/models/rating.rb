class Rating < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :session, optional: true

end
