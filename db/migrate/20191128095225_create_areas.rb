class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :name, null: false
    end
    add_index :areas, :name, unique: true, length: 10
  end
end
