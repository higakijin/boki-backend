class OutputsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show create]

  def index
    lesson = Lesson.find_by!(name: params[:output][:lesson])
    outputs = Output.where(lesson_id: lesson.id)
    render json: outputs
  end

  def show
    output = Output.find(params[:id])
    render json: output
  end

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
