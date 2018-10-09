class Animal < ApplicationRecord
	validates :species, presence: true
	validates :kingdom, presence: true  
	validates :numlegs, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	has_many :products
end
