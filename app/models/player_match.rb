class PlayerMatch < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :match, optional: true
end
