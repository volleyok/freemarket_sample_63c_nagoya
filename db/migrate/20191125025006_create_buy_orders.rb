class CreateBuyOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_orders do |t|
      t.integer     :saler_id
      t.integer     :buyer_id
      t.integer     :fee
      t.integer     :sub_total
      t.integer     :total_amount
      t.timestamps
    end
  end
end
