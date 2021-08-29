class Public::LessonTrainersController < ApplicationController

  def show
    @trainer = Trainer.find(params[:id])
    if current_user.present?
      @relationship = Relationship.new(trainer_id: @trainer.id, user_id: current_user.id)
      @relationships = Relationship.find_by(trainer_id: @trainer.id, user_id: current_user.id)
    end
  end

  def index
    @user = current_user
    @trainers = @user.trainers
  end

  def create

  end
end
