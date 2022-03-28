class AttendedEventsController < ApplicationController
  def create 
    @event = Event.find(params[:id])
  
    if @event.attendees.exists?(id: current_user.id)
      redirect_to @event, alert: "Error! You already joined the event!"
    else
      @event.attendees << current_user

      if @event.save
        redirect_to @event, notice: "Register succeed! You now joined the event"
      end
    end
  end
end
