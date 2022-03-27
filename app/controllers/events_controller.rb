class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index 
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build()
  end

  def create 
    @event = current_user.created_events.build(event_params)

    if @event.save 
      redirect_to user_show_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params 
    params.require(:event).permit(:name, :info, :date, :location, :creator_id)
  end
end
