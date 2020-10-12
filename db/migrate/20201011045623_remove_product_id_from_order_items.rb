class RemoveProductIdFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :product_id, :integer
  end
end
