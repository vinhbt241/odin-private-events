class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]

  def index 
    @past_events = Event.all.where("date <= :now", {now: Time.now})
    @future_events = Event.all.where("date > :now", {now: Time.now})
  end

  def show 
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build()
  end

  def create 
    @event = current_user.created_events.build(event_params)

    if @event.save 
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @event = Event.find(params[:id])
  end
  
  def update 
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def event_params 
    params.require(:event).permit(:name, :info, :date, :location, :creator_id)
  end
end
