class Post < ApplicationRecord
    has_one_attached :image
    has_one :spot, dependent: :destroy
    accepts_nested_attributes_for :spot
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    # 通知
    has_many :notifications, dependent: :destroy
    validates :image, presence: true
     
    def get_image(width, height)
     image.variant(resize_to_limit: [width, height]).processed
    end
     
    def favorited_by?(user)
     favorites.exists?(user_id: user.id)
    end
    
    # 通知(いいね)
    def create_notification_favorite!(current_user)
     # すでに「いいね」されているか検索
     temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
     # いいねされていない場合のみ、通知レコードを作成
     if temp.blank?
       notification = current_user.active_notifications.new(
         post_id: id,
         visited_id: user_id,
         action: 'favorite'
       )
       # 自分の投稿に対するいいねの場合は、通知済みとする
       if notification.visitor_id == notification.visited_id
         notification.checked = true
       end
       notification.save if notification.valid?
     end
    end
    
    # 通帳(コメント)
    def create_notification_comment!(current_user, comment_id)
     # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
     temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
     temp_ids.each do |temp_id|
       save_notification_comment!(current_user, comment_id, temp_id['user_id'])
     end
     # まだ誰もコメントしていない場合は、投稿者に通知を送る
     save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end

    def save_notification_comment!(current_user, comment_id, visited_id)
     # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
     notification = current_user.active_notifications.new(
       post_id: id,
       comment_id: comment_id,
       visited_id: visited_id,
       action: 'comment'
     )
     # 自分の投稿に対するコメントの場合は、通知済みとする
     if notification.visitor_id == notification.visited_id
       notification.checked = true
     end
     notification.save if notification.valid?
    end
    
end
