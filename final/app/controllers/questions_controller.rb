class QuestionsController < ApplicationController

  before_action :find_question, :only => [:show, :edit, :update, :destroy]

  def find_question
    @question = Question.find_by(id: params["id"]) 
  end

  def show
    @question = Question.find_by(id: params["id"]) 
    if @question == nil
      redirect_to courses_url, notice: "question not found." 
    else 
      @answers = @question.answers
    end
  end 

  def new
  end 

  def create
    question = Question.new
    question.title      = params[:title]
    question.content    = params[:content]
    question.user_id    = params[:user_id]
    question.course_id  = params[:course_id]
    question.date       = params[:date]

    question.save
    redirect_to course_url(question.course_id) 

  end 

  def edit
  end 

  def update
    @question.title      = params[:title]
    @question.content    = params[:content]

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

