class Page < ApplicationRecord
	validates :url, presence: true
	validates :typeofcontent, presence: true
	has_one :product
	has_many :page_visit
	has_many :emailMessage
end
