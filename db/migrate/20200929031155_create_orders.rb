class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :addressee
      t.string :name
      t.string :post_code
      t.string :send_to_address
      t.string :how_to_pay, default: 0, null: false,limit: 1
      t.integer :deliver_fee
      t.integer :order_status, default: 0, null: false,limit: 1
      t.integer :total_payment

      t.timestamps
    end
  end
end
