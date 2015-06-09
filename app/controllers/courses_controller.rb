class CoursesController < ApplicationController

  before_action :find_course, :only => [:show]
  before_action :authorize, only: [:show]

  def authorize
    @course = Course.find_by_id(params[:id])
    @user = User.find_by_id(session['user_id'])

    if @user.nil?
      redirect_to login_url, notice: 'You Need to SignIn'
    elsif @course.blank? 
      redirect_to user_url(@user.id), notice: 'No Such Course' 
    elsif @course.enrolls.find_by_user_id(@user.id).nil?
      redirect_to user_url(@user.id), notice: 'No Permission' 
    end
  end

  def find_course 
    @course = Course.find_by(id: params["id"]) 
  end

  def show
    if @course == nil
      redirect_to courses_url, notice: "course not found." 
    end
    @questions = @course.questions
  end 
end

