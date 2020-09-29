class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :addressee
      t.string :name
      t.string :post_code
      t.string :send_to_address
      t.string :how_to_pay
      t.integer :deliver_fee
      t.integer :order_status
      t.integer :total_payment

      t.timestamps
    end
  end
end
