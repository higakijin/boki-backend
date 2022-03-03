class UsersController < ApplicationController
  def check_current_user
    if current_user
      render json: current_user 
    else
      render json: { user: '' }
    end
  end
end
