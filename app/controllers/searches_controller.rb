class SearchesController < ApplicationController
    before_action :authenticate_user!
    
    def search
    #@range = params[:range]
    @users = User.looks(params[:search], params[:word])
    pp @users
    end
end
