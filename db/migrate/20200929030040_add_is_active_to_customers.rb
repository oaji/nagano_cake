class AddIsActiveToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_active, :boolean, default: true, null: false
    add_column :customers, :first_name, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :family_name, :string
    add_column :customers, :family_name_kana, :string
    add_column :customers, :post_code, :string
    add_column :customers, :address, :string
    add_column :customers, :telephone, :string
    add_column :customers, :is_valid, :boolean, default: true, null: false
  end
end
