class CommentsController < ApplicationController
    
    def create
        post = Post.find(params[:post_id])
        comment = current_user.comments.new(post_comment_params)
        comment.post_id = post.id
        comment.save
        post.create_notification_comment!(current_user, comment.id) # 通知
        redirect_to post_path(post)
    end
    
    def destroy
        Comment.find(params[:id]).destroy
        redirect_to post_path(params[:post_id])
    end
    
    private

    def post_comment_params
        params.require(:comment).permit(:comment)
    end
    
end
