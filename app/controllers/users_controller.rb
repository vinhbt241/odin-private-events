class UsersController < ApplicationController
  def show
    @past_created_events = current_user.created_events.where("date <= :now", {now: Time.now})
    @future_created_events = current_user.created_events.where("date > :now", {now: Time.now})
    @past_attended_events = current_user.events.where("date <= :now", {now: Time.now})
    @future_attended_events = current_user.events.where("date > :now", {now: Time.now})
  end
end
