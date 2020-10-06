class ChangeDatePostCodeTo < ActiveRecord::Migration[5.2]
  def change
  	change_column  :addresses, :post_code, :string
  end
end
