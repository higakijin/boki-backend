class OutputsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    output = current_user.outputs.new(output_params)
    output.lesson_id = Lesson.find_by!(name: params[:output][:lesson]).id
    if output.save
      render json: output
    else
      render json: '保存できませんでした'
    end
  end

  private

    def output_params
      params.require(:output).permit(:post)
    end
end
