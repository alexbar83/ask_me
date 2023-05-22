class QuestionsController < ApplicationController
  before_action :set_quest, only: %i[edit show update destroy]
  def create
    @question = Question.create(quest_params)

    redirect_to question_path(@question), notice: 'Новый вопрос создан'
  end

  def edit; end

  def show; end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def update
    @question.update(quest_params)
    redirect_to question_path(@question), notice: 'Сохранили вопрос'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Удалили вопрос'
  end

  private

  def set_quest
    @question = Question.find(params[:id])
  end

  def quest_params
    params.require(:question).permit(:body, :user_id)
  end
end
