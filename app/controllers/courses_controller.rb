class CoursesController < ApplicationController

  before_action :find_course, :only => [:show]

  def find_course 
    @course = Course.find_by(id: params["id"]) 
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

