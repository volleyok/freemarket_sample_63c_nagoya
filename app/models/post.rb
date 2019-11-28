class Post < ApplicationRecord
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :brand
  belongs_to :shipment
  accepts_nested_attributes_for :shipment
  accepts_nested_attributes_for :brand
  # has_many :posts_categories
  # has_many :categories, through: :posts_categories
  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?)', "%#{search}%")
  end
end
