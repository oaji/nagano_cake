class Address < ApplicationRecord
	belongs_to :customer
	validates :post_code, presence: true
	validates :customer_address, presence: true
	validates :name, presence: true

	def customer_info
		"〒#{self.post_code} #{self.customer_address} #{self.name}"
	end
end
