class Post < ApplicationRecord
  belongs_to :user

  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?)', "%#{search}%")
  end
end
