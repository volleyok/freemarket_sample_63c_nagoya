class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :delivery_fee
      t.string :shipping_method
      t.string :ship_from
      t.string :ship_days 
      t.timestamps
    end
  end
end
