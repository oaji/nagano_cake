class CartItem < ApplicationRecord

	has_many :items
	belpngs_to :customer

end
