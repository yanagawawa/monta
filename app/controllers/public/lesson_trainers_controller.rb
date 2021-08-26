class Public::LessonTrainersController < ApplicationController

  def show
    @trainer = Trainer.find(params[:id])
  end

  def index
    @user = current_user
    @trainers = @user.trainers
  end

  def create

  end
end
