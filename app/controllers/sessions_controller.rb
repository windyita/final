class SessionsController < ApplicationController

  def new
    if not session[:user_id].blank?
      redirect_to user_url(session[:user_id]), notice: "Welcome!"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to user_url(user.id), notice: "Welcome back!"
      else
        redirect_to login_url, notice: "Incorrect Password."
      end
    else
      redirect_to login_url, notice: "Unknown Account."
    end
  end

  def destroy 
    session[:user_id] = nil 
    redirect_to root_url, notice: "You've signed out." 
  end
end

