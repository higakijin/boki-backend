class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.new(comment_params)
    comment.output_id = params[:output_id].to_i
    output = Output.find(params[:output_id])
    if comment.save!
      render json: output.comments
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
