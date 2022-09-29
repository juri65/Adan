class Group < ApplicationRecord
    has_many :group_users
    has_many :users, through: :group_users, dependent: :destroy
    # グループオーナー表示のために
    belongs_to :user
    
    has_many :groupposts
    accepts_nested_attributes_for :group_users
    
    validates :name, presence: true, uniqueness: true
    validates :introduction, presence: true
    #attachment :image, destroy: false
    has_one_attached :image
    
    def group_invitation_notification(current_user, visited_id, group_id)
        # すでに招待用の通知が送られているか検索。
        group = Notification.where(visitor_id: current_user.id, visited_id: visited_id, group_id: group_id)
    　　　　  # 上記で検索した通知がない場合のみ、通知レコードを作成。
        if group.blank?
          notification = current_user.active_notifications.new(
            visited_id: visited_id,
            group_id: group_id,
            action: "invitation",
          )
          # エラーがなければ、通知レコードを保存。
          notification.save if notification.valid?
          
        end
    end
end
