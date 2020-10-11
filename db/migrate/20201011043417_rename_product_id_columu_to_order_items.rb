class RenameProductIdColumuToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_items, :product_id, :item_id
  end
end
