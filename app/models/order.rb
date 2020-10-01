class Order < ApplicationRecord
	belongs_to :customer
	has_many :cart_items dependent: :destroy

    validate :name, presence: true
    validate :addressee, presence: true
    validate :post_code, presence: true
    validate :how_to_pay, presence: true

    enum how_to_pay: {
    	card: 0,
    	bank: 1
    }

    enum order_status: {
    	waiting: 0,
    	confirmation: 1,
    	production: 2,
    	preparation: 3,
    	done: 4
    }
end
