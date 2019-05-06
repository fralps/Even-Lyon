class UserMailer < ApplicationMailer
	default from: 'no-reply@event-lyon.fr'

	def welcome_email(user)

		@user = user

		@url = 'https://event-lyon.herokuapp.com/login'

		mail(to: @user.email, subject: 'Bienvenue sur Event Lyon')

	end
end
