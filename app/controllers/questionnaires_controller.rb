class QuestionnairesController < ApplicationController
  before_action :authenticate_user!

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = current_user.questionnaires.build(questionnaire_params)

    if @questionnaire.save
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:question1, :question2, :question3)
  end
end
