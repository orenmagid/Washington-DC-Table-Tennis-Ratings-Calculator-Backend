class Api::V1::PingController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    render json: { message: "You've successfully pinged the site" }
  end

  private
end
