class Post < ApplicationRecord
  validates :images, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :size, presence: true
  validates :status, presence: true
  validates :name, presence: true
  validates :shipment, presence: true
  validates :price, presence: true


  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :brand, dependent: :destroy
  belongs_to :shipment, dependent: :destroy
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  has_many :images, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :shipment, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
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