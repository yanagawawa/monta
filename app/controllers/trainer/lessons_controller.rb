class Trainer::LessonsController < ApplicationController

  def new
   @lesson = Lesson.new
   @trainer = current_trainer
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.total_time = @lesson.lesson_total_time(@lesson.start_time, @lesson.end_time).round
    @lesson.trainer = current_trainer
    if @lesson.save
     redirect_to trainer_trainer_path(@lesson.trainer.id)
    else
     @trainer = current_trainer
     render :new
    end
  end

  def edit

  end

  def update

  end

  private
    def lesson_params
      params.require(:lesson).permit(:trainer_id, :lesson_genre, :take_lesson_genre, :title, :lesson_word, :start_time, :end_time, :total_time, :total_people, :lesson_details, :belongings, :lesson_status, :address)
    end


end
