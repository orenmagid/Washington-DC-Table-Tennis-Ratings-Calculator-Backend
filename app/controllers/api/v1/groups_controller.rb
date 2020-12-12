class Api::V1::RecurringSessionsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @recurring_sessions = RecurringSession.all
    render json: @recurring_sessions
  end
end
