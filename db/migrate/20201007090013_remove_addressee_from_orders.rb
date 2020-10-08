class RemoveAddresseeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :addressee, :string
  end
end
