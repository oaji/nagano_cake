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
