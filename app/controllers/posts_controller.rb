class PostsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
    @post.build_spot
  end
  
  def show
    @post = Post.find(params[:id])
    if @post.spot.present?
      @lat = @post.spot.latitude
      @lng = @post.spot.longitude
      gon.lat = @lat
      gon.lng = @lng
      @spot = @post.spot
    else
      @spot = nil
    end
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(20)
    #@posts = Post.all.order(created_at: :desc)
  end

  def create
    # binding.pry
    if @post = Post.new(post_params)
       @post.user_id = current_user.id
       @post.save!
      # @spot = Spot.new(spot_params)
      # @spot = Spot.new
      # @spot.post_id = @post.id
      # @spot.save!
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
    redirect_to posts_path
    #Comment.find(params[:id]).destroy
    #redirect_to posts_path(params[:post_id])
  end
  
  #投稿データのストロングパラメータ
  private
  
  def post_params
    params.require(:post).permit(:image,:text,spot_attributes: [:address, :latitude, :longitude])
  end 
  
  def spot_params
    params.require(:spot).permit(:latitude,:longitude)
  end 
  
  def ensure_user #例外処理？
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to posts_path unless @post #@postがなかったらposts_path?
  end

  
end
