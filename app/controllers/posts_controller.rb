class PostsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.page(params[:page]).per(8)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to posts_path
    else
    render :new
    end 
  end 
  
  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to post_path
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end
  
  #投稿データのストロングパラメータ
  private
  
  def post_params
    params.require(:post).permit(:image,:text)
  end 
  
  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to post_path unless @post
  end

  
end
