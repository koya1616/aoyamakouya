class Tweet < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
end
