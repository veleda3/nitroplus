class QuestionsController < ApplicationController
  def show
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      @errors = @question.errors.full_messages
      redirect_to "/", notice = @errors
    end
  end

  private

  def question_params
    params.permit(:name, :subject, :email, :message)
  end
end
