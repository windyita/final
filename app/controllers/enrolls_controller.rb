class EnrollsController < ApplicationController

  def create
    user_id = params['user']
    course_id = params['course']

    Enroll.create user_id: user_id, course_id: course_id 
    redirect_to user_url(session[:user_id])
  end 

  def destroy

    e = Enroll.find_by_id(params['id'])
    e.delete
    redirect_to user_url(session[:user_id])
  end
end

