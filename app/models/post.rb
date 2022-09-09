class Post < ApplicationRecord
    has_one_attached :image
    has_one :spot, dependent: :destroy
    accepts_nested_attributes_for :spot
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :image, presence: true
     
    def get_image(width, height)
     image.variant(resize_to_limit: [width, height]).processed
    end
     
     
     
     
    def favorited_by?(user)
     favorites.exists?(user_id: user.id)
    end
end