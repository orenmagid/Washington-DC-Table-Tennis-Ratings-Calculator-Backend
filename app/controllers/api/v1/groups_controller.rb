class Api::V1::GroupsController < ApplicationController
  def index
    @group = Group.all
    render json: @group
  end
end
