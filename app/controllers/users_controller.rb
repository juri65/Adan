class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(20)
   
    Rails.cache.delete('postDelRedirect')
    Rails.cache.fetch('postDelRedirect') do
      "/users/#{@user.id}"
    end

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
    Rails.cache.delete('postDelRedirect')
    Rails.cache.fetch('postDelRedirect') do
      "/users"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id) #エラーメッセージ入れるならここ
    else
      render :edit
    end 
  end
  
  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
        redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
  
end 
