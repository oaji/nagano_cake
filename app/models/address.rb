class Address < ApplicationRecord
	belongs_to :customer

	validates :post_code, presence: true
	validates :customer_address, presence: true
	validates :name, presence: true
end
