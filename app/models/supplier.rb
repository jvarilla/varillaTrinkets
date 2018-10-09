class Supplier < ApplicationRecord
	validates :suppliername, presence: true
	validates :address, presence: true
	validates :phone, length: { is: 11 }, presence:true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	has_many :products
end
