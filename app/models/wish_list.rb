class WishList < ApplicationRecord
	validates :user_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :product_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :dateadded, presence: true
	belongs_to :user
	belongs_to :product
end
