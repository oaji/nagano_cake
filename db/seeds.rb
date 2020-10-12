
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
	telephone:'00066660000',
	email:'ooo@test.com',
	password: 'oooooo'
 )

 Admin.create!(
 	email: "admin1@example.com",
 	password: "123456"
 )

Order.create(
  name:'テスト',
  post_code: '1234567',
  how_to_pay:  1,
  deliver_fee: 800,
  total_payment: 5500,
  customer_id: 1,
  address: '東京',
  order_status: 0
	)

OrderItem.create(
	quantity: 2,
	order_status: 0,
	item_id: 1,
	order_id: 1,
  price: 500
	)
