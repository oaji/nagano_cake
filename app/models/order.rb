class Order < ApplicationRecord
	belongs_to :customer
	belongs_to :cart_items
    belongs_to :item

    validates :name, presence: true
    validates :addressee, presence: true
    validates :post_code, presence: true
    validates :how_to_pay, presence: true

    enum how_to_pay: {
    	キャッシュカード: 0,
    	銀行振込: 1
    }

    enum order_status: {
    	入金待ち: 0,
    	入金確認: 1,
    	制作中: 2,
    	発送準備中: 3,
    	発送済み: 4
    }
end
