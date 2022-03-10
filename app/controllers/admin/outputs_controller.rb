class Admin::OutputsController < ApplicationController
  before_action :authenticate_user!
  before_action :need_permission

  def update
    #Outputの承認（すでに承認済みならキャンセル）を行う。
    output = Output.find(params[:id])
    output.update!(be_finished: !output.be_finished)
    render json: output.user
  end

  private

  def need_permission
    raise ArgumentError, 'あなたは誰ですか？' unless current_user.is_admin
  end
end
