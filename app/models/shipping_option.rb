class ShippingOption < ApplicationRecord
	validates :optionname, length: { maximum: 30 }, presence: true
	validates :shipclass, inclusion: %w{ Standard Business Rush }, presence: true
	validates :minshiptime, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
	validates :maxshiptime, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :shipprovider, inclusion: %w{ USPS UPS FedEx Heli-Raptor Amazon}, presence: true
	has_many :orders
end
