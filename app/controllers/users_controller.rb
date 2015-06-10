class UsersController < ApplicationController

  before_action :authorize, only: [:show, :edit, :update]

  def authorize
    @user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to login_url, notice: 'No Permission' 
    end
  end

  def new 
    @user = User.new 
  end

  def create
    @user = User.new(email: params[:email], 
                    name: params[:name], 
                    password: params[:password],
                    role: params[:role],
                    dept: params[:dept])
    if @user.save
      redirect_to login_url, notice: "Thanks for signing up."
    else
      render "new"
    end
  end

  def show
    @enrolled_courses = @user.courses
    # @unenroll_courses = Course.all - @enrolled_courses
    @unenroll_courses = Course.where('id NOT IN (?)',  @enrolled_courses.select(:id)).page(params[:page]).per(25)

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
