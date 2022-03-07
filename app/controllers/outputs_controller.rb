class OutputsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show create update]

  def index
    lesson = Lesson.find_by!(name: params[:output][:lesson])
    outputs = Output.where(lesson_id: lesson.id).order(:updated_at) 
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
      render json: output.errors
    end
  end

  def update
    lesson = Lesson.find_by!(name: params[:output][:lesson])
    output = current_user.outputs.find_by!(lesson_id: lesson.id )
    if output.update(output_params)
      render json: output
    else
      render json: output.errors
    end
  end

  private

    def output_params
      params.require(:output).permit(:post)
    end
end
