class Review < ApplicationRecord
	validates :user_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :product_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :title, length: { maximum: 20 }, presence: true
	validates :comment, length: { maximum: 200 }, presence: true
	validates :rating, numericality: true, inclusion: { in: 0..5}, presence: true
	validates :postdate, presence: true
	belongs_to :user
	belongs_to :product
end
