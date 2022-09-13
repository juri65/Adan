class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(20)
   
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render :edit
    else
    redirect_to posts_path
    end
  end

  def index
    #@userposts = current_user.posts.page(params[:page]).per(8)
    #pluckにpushすることで自分の投稿も表示させている(whereの中にarr)
    arr = current_user.followings.pluck(:id).push(current_user.id)
    @following_posts = Post.where(user_id: arr ).order(created_at: :desc).page(params[:page]).per(20)
  
    #.order(created_at: :desc)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id) #エラーメッセージ入れるならここ
    else
      render :edit
    end 
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
  
end 
