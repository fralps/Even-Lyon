class Attendance < ApplicationRecord
	after_create :welcome_event
	belongs_to :user
	belongs_to :event

	#validates :stripe_customer_id, uniqueness: true

	def welcome_event
		event_id = self.event_id
		event = Event.find(event_id)
		UserMailer.event_welcome_email(event).deliver_now
	end
end
