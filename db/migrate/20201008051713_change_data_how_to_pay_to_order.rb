class ChangeDataHowToPayToOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :how_to_pay, :integer
  end
end
