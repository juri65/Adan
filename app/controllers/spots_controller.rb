class SpotsController < ApplicationController
    before_action :set_spot, only: [:index]
    
    def create
        @spot = Post.new(spot_params)
     if @spot.valid?
        @spot.save
        redirect_to "/users/#{current_user.id}"
     else
     render :new
     end
    end

    def index
        @spot = Spot.new(spot_params)
    end

    private

    def set_spot
        @spot = Spot.find(params[:id])
    end

    def spot_params
         params.require(:spot).permit(:address).merge(user_id: current_user.id)
    end
end
