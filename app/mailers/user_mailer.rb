class UserMailer < ApplicationMailer
	default from: 'no-reply@event-lyon.fr'

	def welcome_email(user)

		@user = user

		@url = 'https://event-lyon.herokuapp.com/login'

		mail(to: @user.email, subject: 'Bienvenue sur Event Lyon')

	end

	def event_welcome_email(event)
		admin_id = event.admin_id
		@admin = User.find(admin_id)
		@url = 'https://event-lyon.herokuapp.com/event/attendance'

		mail(to: @admin.email, subject: 'Nouveau participant')

	end
end
