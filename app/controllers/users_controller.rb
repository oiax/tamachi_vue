class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  def new
  end

  def edit
  end
end
