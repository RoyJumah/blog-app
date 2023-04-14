class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    @comment.save
    flash[:success] = 'Commented!'
    redirect_to posts_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted!'
      @comment.post.decrement!(:comments_counter)
    else
      flash[:danger] = 'Comment not deleted!'
    end
    redirect_to posts_path(@post)
  end



  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
