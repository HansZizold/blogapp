class Api::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users.select(:id, :name, :email)
  end
end
