class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :need_permission

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    # プランの変更を行う
    user.update!(admin_user_params)
    render json: user
  end

  private

    def need_permission
      raise ArgumentError, 'あなたは誰ですか？' unless current_user.is_admin
    end

    def admin_user_params
      plan_name = params[:user][:plan]
      params.require(:user).permit(:plan) if %w[basic plus pro].include?(plan_name)
    end
end
