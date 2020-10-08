class RemoveSendToAddressFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :send_to_address, :string
  end
end
