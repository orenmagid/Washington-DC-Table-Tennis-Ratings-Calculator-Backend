class Api::V1::SignupFormsController < ApplicationController
  skip_before_action :authorized

  def index
    @signup_forms = SignupForm.all
    render json: @signup_forms, include: ["stage", "recurring_sessions", "player_intents", "player_intents.player", "player_intents.player.ratings"]
  end

  def create
    recurring_session_ids = params[:recurring_session_ids]

    signup_form = SignupForm.new(active: true, stage_id: 1)

    recurring_session_ids.each do |recurring_session_id|
      recurring_session = RecurringSession.find(recurring_session_id)
      default_date = recurring_session.get_default_date

      signup_form.recurring_sessions.push(recurring_session)
    end
    if signup_form.save
      render json: signup_form, status: :accepted
    end
  end

  def update
    recurring_session_ids = params[:recurring_session_ids]
    player_id = params[:player_id]
    signup_form_id = params[:id]
    stage_id = params[:stage_id]
    active = params[:active]

    signup_form = SignupForm.find(signup_form_id)

    current_session_ids = signup_form.recurring_sessions.map { |rs| rs.id }
    puts("🚀 ~ file: signup_forms_controller.rb ~ line 35 ~ current_session_ids", current_session_ids)

    current_session_ids_to_delete = (current_session_ids - recurring_session_ids)
    puts("🚀 ~ file: signup_forms_controller.rb ~ line 38 ~ current_session_ids_to_delete", current_session_ids_to_delete)
    new_recurring_session_ids = (recurring_session_ids - current_session_ids)
    puts("🚀 ~ file: signup_forms_controller.rb ~ line 40 ~ new_recurring_session_ids", new_recurring_session_ids)

    current_session_ids_to_delete.each do |current_session_id|
      signup_form_recurring_session = SignupFormRecurringSession.find_by(recurring_session_id: current_session_id, signup_form_id: signup_form_id)
      signup_form_recurring_session.destroy
    end

    new_recurring_session_ids.each do |recurring_session_id|
      recurring_session = RecurringSession.find(recurring_session_id)
      signup_form.recurring_sessions.push(recurring_session)
    end

    signup_form.update(active: active, stage_id: stage_id)
    if signup_form.save
      render json: signup_form, status: :accepted
    end
  end

  def destroy
    signup_form_id = params[:id]

    signup_form = SignupForm.find(signup_form_id)

    if signup_form.destroy
      render json: signup_form, status: :accepted
    end
  end
end
