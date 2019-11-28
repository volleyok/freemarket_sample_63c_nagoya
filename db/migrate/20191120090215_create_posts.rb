class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string      :name
      t.text        :description
      t.text        :size
      t.integer     :price
      t.string      :status
      t.string     :category
      t.timestamps
      t.integer     :seller_id
      t.integer     :buyer_id
      t.integer     :brand_id
      t.integer     :shipment_id
    end
  end
end
