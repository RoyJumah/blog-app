class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.update_comments_counter
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private


  def comment_params
    params.require(:comment).permit(:text, :post_id).merge(author_id: params[:user_id])
  end
end
