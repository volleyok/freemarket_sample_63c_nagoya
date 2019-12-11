class AddBrandRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :brand, foreign_key: true
  end
end
