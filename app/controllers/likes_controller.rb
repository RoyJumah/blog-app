class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    @like.save
    flash[:success] = 'Liked!'
    redirect_to posts_path(params[:post_id])
  end
end
