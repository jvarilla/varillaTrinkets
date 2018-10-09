class PageVisit < ApplicationRecord
	validates :user_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :page_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :visitdate, presence: true
	belongs_to :user
	belongs_to :page
end
