# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
 Customer.create!(
 	family_name:'山田',
 	first_name:'太郎',
 	family_name_kana:'ヤマダ',
 	first_name_kana:'タロウ',
 	post_code:'123-4567',
 	address:'東京都世田谷区3333',
 	telephone:'0000000',
 	email:'ooo@example.com',
 	password: 'oooooo'
 )

 Address.create!(
 	post_code:'333-3333',
 	customer_address:'東京都新宿区100',
 	name:'一郎',
 	)
# Order.create!(
#  	post_code:'000-0000'
#     customer_address:'00-00'
#     name:'aaa'
#     addressee:'0000'
#     deliver_fee:'100'
#     how_to_pay:'333'
#  	)
# 10.times do |number|
# 	Order.create(order_id: "#{number}")
# end
# customer_id
#       t.string :addressee
#       t.string :name
#       t.string :post_code
#       t.string :send_to_address
#       t.string :how_to_pay
#       t.integer :deliver_fee