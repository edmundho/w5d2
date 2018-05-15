
class PostsController < ApplicationController
  
  before_action :require_login
  
  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]
    # fail
    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    # fail
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    flash[:errors] = @post.errors.full_messages
    redirect_to post_url(@post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to sub_url(post.sub)
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :url, sub_ids: [])
  end
end
