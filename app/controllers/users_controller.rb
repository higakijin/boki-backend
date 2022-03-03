class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  def update
    render json: current_user if current_user.update!(user_params)
  end

  def check_current_user
    if current_user
      render json: current_user
    else
      render json: { user: '' }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end
end
