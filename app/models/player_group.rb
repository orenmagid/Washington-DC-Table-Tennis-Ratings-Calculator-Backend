class PlayerGroup < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :group, optional: true
end
