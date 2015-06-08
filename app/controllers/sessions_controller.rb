class SessionsController < ApplicationController

  def new
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've signed out."
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        session["user_id"] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown Password."
      end
    else
      redirect_to root_url, notice: "Unknown Email."
    end
  end
end

