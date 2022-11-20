class Public::TheaterCommentsController < ApplicationController
  def create
    theater = Theater.find(params[:theater_id])
    @comment = current_user.theater_comments.new(theater_comment_params)
    @comment.theater_id = theater.id
    @comment.save

  end

  def destroy
    @comment = TheaterComment.find_by(id: params[:id], theater_id: params[:theater_id])
    @comment.destroy
  end
  private
  def theater_comment_params
    params.require(:theater_comment).permit(:comment)
  end

end
