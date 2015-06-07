class CoursesController < ApplicationController

  before_action :find_course, :only => [:show]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def find_course 
    @course = Course.find_by(id: params["id"]) 
  end

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end

  def index 
    @courses = Course.all
  end 

  def show
    if @course == nil
      redirect_to courses_url, notice: "course not found." 
    end
    @questions = @course.questions
  end 
end

