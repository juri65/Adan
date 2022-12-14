class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :posts, dependent: :destroy
   has_many :group_users
   has_many:groups, through: :group_users,dependent: :destroy
   # グループオーナー表示のため
   has_many :owned_groups, class_name: "Group"
   
   has_many :favorites, dependent: :destroy
   has_many :comments, dependent: :destroy
   # フォローをした、されたの関係
   has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
   has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
   # 一覧画面で使う
   has_many :followings, through: :relationships, source: :followed
   has_many :followers, through: :reverse_of_relationships, source: :follower
   # 通知
   has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
   has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
   
   has_one_attached :profile_image
   validates :introduction, presence: false, length: { maximum: 50 }
   
   def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
   end
   
     # is_deletedがfalseならtrueを返すようにしている
    def active_for_authentication?
      super && (is_deleted == false)
    end
   
   def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
   end
   
   # フォローしたときの処理
    def follow(user_id)
        unless user_id == self.id
        relationships.create(followed_id: user_id)
        end 
    end
    # フォローを外すときの処理
    def unfollow(user_id)
        relationships.find_by(followed_id: user_id).destroy
    end
    # フォローしているか判定
    def following?(user)
        followings.include?(user)
    end
    
    # 通知(フォロー)
    def create_notification_follow!(current_user)
        temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
        if temp.blank?
          notification = current_user.active_notifications.new(
            visited_id: id,
            action: 'follow'
          )
          notification.save if notification.valid?
        end
    end
   
   # 検索方法分岐
   def self.looks(search, word)
    #if search == "perfect_match"
      @user = User.where("name LIKE ?", "%#{word}%")
    #elsif search == "forward_match"
      #@user = User.where("name LIKE?","#{word}%")
    #elsif search == "backward_match"
      #@user = User.where("name LIKE?","%#{word}")
    #elsif search == "partial_match"
      #@user = User.where("name LIKE?","%#{word}%")
    #else
      #@user = User.all
    #end
   end
   
end
