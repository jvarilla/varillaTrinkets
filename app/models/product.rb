class Product < ApplicationRecord
	validates :page_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :supplier_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :prodname, presence: true
	# validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
	# validates :length, presence: true
	# validates :width, presence: true
	# validates :height, presence: true
	# validates :mainimg, presence: true
	validates :numinstock, numericality: { greater_than_or_equal_to: 0, only_integer: true }, presence: true
	validates :description, length: { maximum: 1000 }
	validates :primarycolor, inclusion: %w{ blue teal green yellow orange red pink purple black brown white clear }, presence: true
	# validates :secondarycolor, inclusion: %w{ blue teal green lime yellow orange red pink purple black brown white clear }
	belongs_to :supplier
	has_many :order_item
	belongs_to :animal
	has_one :page
	has_many :wish_list
	has_many :reviews
end
