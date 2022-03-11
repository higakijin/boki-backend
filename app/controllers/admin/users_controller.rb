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

  private

    def need_permission
      raise ArgumentError, 'あなたは誰ですか？' unless current_user.is_admin
    end
end
