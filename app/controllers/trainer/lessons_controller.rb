class Trainer::LessonsController < ApplicationController

  def new
   @lesson = Lesson.new
   @trainer = current_trainer

  end

  def create

  end

  def edit

  end

  def update

  end

  private
    def lesson_params
      params.require(:lesson).permit(:title, :lesson_word, :start, :end, :total_time, :total_people, :lesson_location, :lesson_details, :belongings, :lesson_status)
    end


end
