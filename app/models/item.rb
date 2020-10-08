class Item < ApplicationRecord

	# refileを使用する
	attachment :image
	# カートの商品との紐付け
	has_many :cart_items, dependent: :destroy
	# 注文詳細との紐付け
	has_many :ordered_items,dependent: :destroy
	has_many :orders, through: :ordered_items
	# ジャンルとの紐付け
	belongs_to :genre

	with_options presence: true do
    # validates :image
   	validates :name, length: {minimum: 1, maximum:15}
	validates :introduction, length: { maximum: 200 }
    validates :genre_id
    validates :price, numericality: true
  end


	# # is_stoppedカラムがfalseであるものを取得する
	# scope :active, -> {where(is_stopped: false)}


end
