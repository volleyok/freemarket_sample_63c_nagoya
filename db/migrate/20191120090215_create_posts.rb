class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string        :name         , null: false
      t.text          :description  , null: false
      t.string        :size         , null: false
      t.integer       :price        , null: false
      t.string        :status       , null: false
      # t.references    :category     , null: false , foreign_key: true
      t.references    :seller       , foreign_key: { to_table: :users }
      t.references    :buyer        , foreign_key: { to_table: :users }
      # t.references    :brand        , foreign_key: true
      # t.references    :shipment     , null: false , foreign_key: true
      t.timestamps
    end
  end
end
