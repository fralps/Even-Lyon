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
	redirect_to gods_events_path
end
end