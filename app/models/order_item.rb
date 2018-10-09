class OrderItem < ApplicationRecord
	validates :order_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :product_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	# validates :boxmessage, length: { maximum: 60 }
	# validates :tagmessage, length: { maximum: 20 }
	# validates :tagcolor, inclusion: %w(blue red green yellow pink purple white)
	# validates :tagfontcolor, inclusion: %w(black white silver gold)
	belongs_to :order 
	belongs_to :product
end
