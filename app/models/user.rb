class User < ApplicationRecord
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true
	has_many :orders
	has_many :wish_list
	has_many :page_visit
	has_many :email_list
	has_many :reviews
	validates :username, presence:true, uniqueness:true
	has_secure_password

end
