class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_img, :string
    add_column :users, :lastname, :string, null: false
    add_column :users, :firstname, :string, null: false
    add_column :users, :lastname_kana, :string, null: false
    add_column :users, :firstname_kana, :string, null: false
    add_column :users, :birthday_year, :integer
    add_column :users, :birthday_month, :integer
    add_column :users, :birthday_day, :integer
    add_column :users, :postal_code, :string, null: false
    add_column :users, :prefecture, :string,  null:false
    add_column :users, :city, :string,  null:false
    add_column :users, :address, :string,  null:false
    add_column :users, :building_name, :string
    add_column :users, :phone_number, :string
  end
end
