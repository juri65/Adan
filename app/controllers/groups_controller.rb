class GroupsController < ApplicationController
    before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def index
    @post = Post.new
    @groups = Group.all.order(updated_at: :desc)
  end

  def show
    #@post = Post.new
    @group = Group.find_by(id: params[:id])
    if !@group.users.include?(current_user)
      @group.users << current_user
    end
    @groupposts = Grouppost.where(group_id: @group.id).all
    @other_users = @group.get_other_users
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    #追記
    @group.users << current_user
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
#current_userは、@group.usersから消されるという記述。
    @group.users.delete(current_user)
    redirect_to groups_path
  end
  
  def all_destroy
    @group = Group.find(params[:group_id])
    if @group.destroy
    redirect_to groups_path
    end
  end
  
  def invitation
    @group = Group.find(params[:group_id])
    #この後 view に設置するフォームの値を参照する。
    @user = User.find_by(id: params[:user_id])
    notification = Notification.where(visited_id: @user.id, group_id: @group.id, action: "invitation")
    unless notification.exists?
      # それぞれの仮引数を置き換えて、group.rb に記述したメソッドを呼び出す。
      @group.group_invitation_notification(current_user, @user.id, @group.id)
      # 遷移する前のURLを取得し、リダイレクトさせる。
      redirect_to request.referer, notice: "招待を送りました。"
    else
      redirect_to request.referer, alert: "すでに招待しています。"
    end
  end 
  
  def join
    @group = Group.find(params[:id])
    # @group.users に、current_userのレコードが含まれていなければ以下の処理を行う。
    unless @group.users.include?(current_user)
    # @group.users に、current_user のレコードを追加する。
      @group.users << current_user
      # 招待通知を検索して削除。
      notification = Notification.find_by(visited_id: current_user.id, group_id: @group.id, action: "invitation")
      notification.destroy
    end
    redirect_to group_path(@group), notice: "チームに参加しました。"
  end


  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image, :user_id [])
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
