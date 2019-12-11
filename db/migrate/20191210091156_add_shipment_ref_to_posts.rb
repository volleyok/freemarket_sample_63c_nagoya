class AddShipmentRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :shipment, foreign_key: true
  end
end
