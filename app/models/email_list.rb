class EmailList < ApplicationRecord
	validates :user_id, numericality: { only_integer: true, greater_than_or_equal_to: 0},  presence: true
	validates :emailMessage_id, numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
	belongs_to :emailMessage
	belongs_to :user
end
