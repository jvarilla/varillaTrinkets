class EmailMessage < ApplicationRecord
	validates :page_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	validates :subject, presence: true
	validates :message, presence: true
	has_many :email_list
	belongs_to :page
end
