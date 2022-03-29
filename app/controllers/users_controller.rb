class UsersController < ApplicationController
  def show
    @past_created_events = current_user.created_events.where("date <= :now", {now: Time.now})
    @future_created_events = current_user.created_events.where("date > :now", {now: Time.now})
    @past_attended_events = current_user.events.where("date <= :now", {now: Time.now})
    @future_attended_events = current_user.events.where("date > :now", {now: Time.now})
  end

  def create 
    @user = User.new(user_params)
    @user.save
    sign_in(@user)  
    flash.notice = "User #{@user.name} successfully created! Thank you for signing up!"
    redirect_to user_show_path
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :password, :password_confirmation)
  end
end
