class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  def update
    if params[:level_name]
      # 学習中のレベルの更新
      level = Level.find_by!(name: params[:level_name])
      current_user.update!(level_id: level.id)
    else
      # 普通にプロフィール（名前など）を更新
      current_user.update!(user_params)
    end

    render json: current_user
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
