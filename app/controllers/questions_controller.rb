class QuestionsController < ApplicationController

  before_action :find_question, :only => [:show, :edit, :update, :destroy]

  def find_question
    @question = Question.find_by(id: params["id"]) 
  end

  def show
    @question = Question.find_by(id: params["id"]) 
    if @question.nil?
      redirect_to courses_url, notice: "question not found." 
    else 
      @answers = @question.answers
    end
  end 

  def new
    @question = Question.new
    @course_id = params['course_id']
    @user_id = session['user_id']
  end 

  def create
    h = params.require(:question).permit(:title, :content, :user_id, :course_id, :date)
    @question = Question.new(h)

    if @question.save
      redirect_to course_url(@question.course_id) 
    else
      render 'new'
    end

  end 

  def edit
  end 

  def update
    h = params.require(:question).permit(:title, :content)
    @question.title      = h[:title]
    @question.content    = h[:content]

    @question.save
    redirect_to course_url(@question.course_id) 

  end

  def destroy
    @question.answers.each do |a| 
      a.delete
    end 
    @question.delete
    redirect_to course_url(@question.course_id) 
  end 
end

