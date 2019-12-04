class Post < ApplicationRecord
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :brand
  belongs_to :shipment
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  accepts_nested_attributes_for :shipment
  accepts_nested_attributes_for :brand
  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?)', "%#{search}%")
  end
  def iine(user)
    likes.create(user_id: user.id)
  end
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end
  def iine?(user)
    iine_users.include?(user)
  end
end
