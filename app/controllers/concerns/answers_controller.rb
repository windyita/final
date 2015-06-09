class AnswersController < ApplicationController

  before_action :find_answer, :only => [:destroy]

  def find_answer
    @answer = Answer.find_by(id: params["id"]) 
  end

  def new
    @answer = Answer.new
    @course_id = params['course_id']
    @question_id = params['question_id']
    @user_id = session['user_id']
  end 

  def create
    h = params.require(:answer).permit(:content, :user_id, :question_id, :date)
    @answer = Answer.new(h)

    if @answer.save
      course_id = @answer.question.course.id
      redirect_to course_url(course_id, 'qid': @answer.question.id) 
    else
      render 'new'
    end

  end 

  def update
    h = params.require(:question).permit(:title, :content)
    @question.title      = h[:title]
    @question.content    = h[:content]

    @question.save
    redirect_to course_url(@question.course_id) 

  end

  def destroy
    question_id = params['qid']
    course_id = @answer.question.course.id
    @answer.delete
    redirect_to course_url(course_id, 'qid': question_id) 
  end 
end

