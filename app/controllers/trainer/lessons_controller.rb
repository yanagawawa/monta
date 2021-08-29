class Trainer::LessonsController < ApplicationController
before_action :authenticate_trainer!
  def new
   @lesson = Lesson.new
   @trainer = current_trainer
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.total_time = @lesson.lesson_total_time(@lesson.start_time, @lesson.end_time).round
    @lesson.trainer = current_trainer
    if @lesson.save
     redirect_to lesson_path(@lesson.id)
    else
     @trainer = current_trainer
     render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @trainer = current_trainer
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.total_time = @lesson.lesson_total_time(@lesson.start_time, @lesson.end_time).round
    @lesson.trainer = current_trainer
    if @lesson.update(lesson_params)
      if lesson_params[:lesson_status] == "held"
        @lesson.reserves.where(take_lesson_status: "not_held").update_all(take_lesson_status: "held")
      elsif lesson_params[:lesson_status] == "cancel"
        @lesson.reserves.update_all(take_lesson_status: "cancel")
      end
     redirect_to lesson_path(@lesson.id)
    else
     @trainer = current_trainer
     render :edit
    end
  end

  private
    def lesson_params
      params.require(:lesson).permit(:trainer_id, :lesson_genre, :take_lesson_genre, :title, :lesson_word, :start_time, :end_time, :total_time, :total_people, :lesson_details, :belongings, :lesson_status, :address)
    end


end
