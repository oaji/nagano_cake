class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.integer :post_code
      t.string :customer_address
      t.string :name

      t.timestamps

      zip_code = 'xxxyyyy'
      zip_code.insert(3, '-').split('-')
    end
  end
end
