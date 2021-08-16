class Trainer::LessonsController < ApplicationController

  def new
   @lesson = Lesson.new
   @trainer = current_trainer
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.total_time = @lesson.lesson_total_time(@lesson.start, @lesson.end).round
    @lesson.trainer = current_trainer
    if @lesson.save
     redirect_to trainer_trainer_path(@lesson.trainer.id)
    else
     render :new
    end
  end

  def edit

  end

  def update

  end

  private
    def lesson_params
      params.require(:lesson).permit(:trainer_id, :lesson_genre, :take_lesson_genre, :title, :lesson_word, :start, :end, :total_time, :total_people, :lesson_location, :lesson_details, :belongings, :lesson_status)
    end


end
