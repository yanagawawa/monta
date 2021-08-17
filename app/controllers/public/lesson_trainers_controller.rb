class Public::LessonTrainersController < ApplicationController

  def show
    @trainer = Trainer.find(params[:id])
  end

  def index
  end

  def create

  end
end
