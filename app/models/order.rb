class Order < ApplicationRecord
  	belongs_to :customer
    belongs_to :item, optional: true
    has_many :order_items, dependent: :destroy

    validates :name, presence: true
    validates :address, presence: true
    validates :post_code, presence: true
    validates :how_to_pay, presence: true

    enum how_to_pay: {
    	クレジットカード: 0,
    	銀行振込: 1
    }

    enum order_status: {
    	入金待ち: 0,
    	入金確認: 1,
    	製作中: 2,
    	発送準備中: 3,
    	発送済み: 4
    }


end
