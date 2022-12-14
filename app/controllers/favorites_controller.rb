class FavoritesController < ApplicationController
    
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    #binding.pry
    favorite.save
    #if params[:format].nil?
      #redirect_to users_path
    #else
      #redirect_to post_path(post)
    #end
    @post.create_notification_favorite!(current_user)# 通知
    respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
      end
    render :toggle
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    #binding.pry
    favorite.destroy
    #if params[:format].nil?
      #redirect_to users_path
    #else
      #redirect_to post_path(post)
    #end
    render :toggle
  end
  
end
