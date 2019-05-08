class AttendancesController < ApplicationController

	def index
		@event = Event.find(params[:id])
	end
end
