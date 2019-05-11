class Gods::EventsController < ApplicationController
def index
	@events = Event.all
end

def show
	@event = Event.find(params[:id])
end

def update
	@event = Event.find(params[:id])
	@event.update(validated: params[:validated])
	if @event.update(validated: params[:validated]) && @event.validated == true
		UserMailer.event_validated_email(@event.admin, @event).deliver_now
	end
	redirect_to gods_events_path
end


end