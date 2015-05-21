class UsersController < ApplicationController
  def new 
    @user = User.new 
  end

  def create
    @user = User.new(email: params[:email], 
                    passwd: params[:passwd],
                    role: params[:role],
                    dept: params[:dept])
    if @user.save
      redirect_to root_url, notice: "Thanks for signing up."
    else
      render "new"
    end
  end
end
