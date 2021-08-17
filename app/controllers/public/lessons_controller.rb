class Public::LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    if current_user.present?
     @relationship = Relationship.new(trainer_id: @lesson.trainer.id, user_id: current_user.id)
    end
    @relationships = Relationship.find_by(trainer_id: @lesson.trainer.id, user_id: current_user.id)
    gon.lesson = @lesson
  end

  def calendar
    @lessons = Lesson.all
  end

end
