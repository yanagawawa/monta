class Trainer::LessonsController < ApplicationController

  def new
   @lesson = Lesson.new
   @trainer = current_trainer

  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.total_time.round = lesson_total_time(@lesson.start, @lesson.end)
    @lesson.date_validation = date_validation(@lesson.start, @lesson.end)
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
