class UserMailer < ApplicationMailer
	default from: 'no-reply@event-lyon.fr'

	def welcome_email(user)

		@user = user

		@url = 'https://event-lyon.herokuapp.com/login'

		mail(to: @user.email, subject: 'Bienvenue sur Event Lyon')

	end

	def event_welcome_email(event, user)
		@user = user
		@event = event
		@url = 'https://event-lyon.herokuapp.com/event/attendance'

		mail(to: @event.admin.email, subject: "#{@user.first_name} vient de s'inscrire")

	end
end
