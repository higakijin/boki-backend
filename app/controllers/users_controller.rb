class UsersController < ApplicationController
  def check_current_user
    if current_user
      render json: { data: current_user }
    else
      render json: { data: '' }
    end
  end
end
