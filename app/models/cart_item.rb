class CartItem < ApplicationRecord
	has_many :orders, dependent: :destroy
end
