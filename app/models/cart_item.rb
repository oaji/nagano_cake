class CartItem < ApplicationRecord
	has_many :orders, dependent: :destroy
	has_many :items
	belpngs_to :customer

end
