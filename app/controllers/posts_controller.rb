class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts, items: 10)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:danger] = 'Post not created!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post deleted!'
      @post.author.decrement!(:posts_counter)
    else
      flash[:danger] = 'Post not deleted!'
    end
    redirect_to posts_path
  end



  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
