class Order < ApplicationRecord
	#validates :user_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :orderdate, presence: true
	# validates :shipaddress, presence: true
	# validates :shipcity, presence: true
	# validates :shipstate, presence: true
	# validates :shipzip, presence: true
	# validates :billaddress, presence: true
	# validates :billcity, presence: true
	# validates :billstate, presence: true
	# validates :billzip, presence: true
	# validates :orderconfirmationnumber, numericality: true, uniqueness: true, presence: true
	# validates :cardmerchant, inclusion: %w{Visa Mastercard Discover American-Express}, presence: true
	has_many :order_item
	belongs_to :user
	# inclusion of any of these statements after belongs_to  causes a nil error :shipping_option :shipping_options
	# :shippingOption :shippingOptions :shippingoption :shippingoptions but the code works just fine as is with the has_many linkage
	# from shipping_options to orders
end
