class Api::V1::PlayerIntentsController < ApplicationController
  def create_or_update
    recurring_session_ids = params[:recurring_session_ids]
    player_id = params[:player_id]
    signup_form_id = params[:signup_form_id]

    signup_form = SignupForm.find(signup_form_id)

    current_session_ids = signup_form.player_intents.map { |pi| pi.recurring_session_id }

    current_session_ids_to_delete = (current_session_ids - recurring_session_ids)

    new_recurring_session_ids = (recurring_session_ids - current_session_ids)

    current_session_ids_to_delete.each do |current_session_id|
      player_intent = PlayerIntent.find_by(player_id: player_id, recurring_session_id: current_session_id, signup_form_id: signup_form_id)
      player_intent.destroy
    end

    new_recurring_session_ids.each do |recurring_session_id|
      player_intent = PlayerIntent.create(player_id: player_id, recurring_session_id: recurring_session_id, signup_form_id: signup_form_id)
      signup_form.player_intents.push(player_intent)
    end

    if signup_form.save
      render json: signup_form, status: :accepted
    end
  end
end
