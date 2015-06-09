class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update]

  def authorize
    @user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to root_url, notice: "Nice try!"
    end
  end

  def new 
    @user = User.new 
  end

  def show
  end

  def edit
  end

  def update
    if @user.authenticate(params[:password])
      @user.name = params[:name]
      @user.dept = params[:department]
      @user.password = params[:password]
      @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to user_path(@user.id), notice: "Wrong password!"
    end
  end

  def create
    @user = User.new(email: params[:email], 
                    name: params[:name], 
                    password: params[:password],
                    role: params[:role],
                    dept: params[:dept])
    if @user.save
      redirect_to root_url, notice: "Thanks for signing up."
    else
      render "new"
    end
  end

end

