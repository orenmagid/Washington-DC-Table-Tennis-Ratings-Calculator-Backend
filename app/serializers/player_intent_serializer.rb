class PlayerIntentSerializer < ActiveModel::Serializer
  belongs_to :player
  belongs_to :recurring_session
  belongs_to :signup_form

  attributes :id, :player_id, :recurring_session_id, :signup_form_id
end
