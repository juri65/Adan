class SpotsController < ApplicationController
    before_action :set_spot, only: [:show, :edit, :update, :destroy]
    
    def new
        @post = Post.new
        @user.User.new
    end
    
    def create
        @post = Post.new(post_params)
     if @post.valid?
        @post.save!
        redirect_to post_path(@post)
     else
     render :new
     end
    end

    def index
       
    end

    private

    def set_spot
        @spot = Spot.find(params[:id])
    end

    def spot_params
         params.require(:spot).permit(:address).merge(user_id: current_user.id)
    end
    
    def user_params
      params.require(:user).permit(:name)
    end
end
