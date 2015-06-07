class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def new 
    @user = User.new 
  end

  def authorize
    @user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to root_url, notice: "Nice try!"
    end
  end

  def show
  end

  def create
    @user = User.new(email: params[:email], 
                    name: params[:name], 
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

