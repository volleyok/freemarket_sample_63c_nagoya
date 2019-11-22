class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string      :name
      t.text        :description
      t.string      :cotegory
      t.string      :status
      t.string      :postage
      t.string      :ship_from
      t.string      :shipping_date
      t.integer     :price
      t.timestamps
      t.integer     :user_id
    end
  end
end
