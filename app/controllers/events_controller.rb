class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(admin: current_user, start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
		@event.save

		if @event.save
			redirect_to root_path
			flash[:success] = "Your event has been successfully created"
		else
			render 'new'
		end
  end

  def show  	
  end
end
