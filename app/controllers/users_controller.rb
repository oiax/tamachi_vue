class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  # XHR
  def show
    render json: User.find(params[:id]).to_json(
      only: [ :name, :language, :other_language ])
  end

  def new
  end

  def edit
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { result: "OK" }
    else
      render json: { errors: user.errors.to_hash }
    end
  end

  def update
    user = User.find(params[:id])
    user.assign_attributes(user_params)
    if user.save
      render json: { result: "OK" }
    else
      render json: { errors: user.errors.to_hash }
    end
  end

  private def user_params
    params.require(:user).permit(
      :name, :language, :other_language
    )
  end
end
