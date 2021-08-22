class Public::LessonsController < ApplicationController

  def index
    @lessons = Lesson.where("lessons.start_time > ?", DateTime.now).reorder(:start_time)
    @search_params = lesson_search_params
    @trainers = Lesson.search(@search_params).includes(:prefecture)
  end

  def show
    @lesson = Lesson.find(params[:id])
    if current_user.present?
      @relationship = Relationship.new(trainer_id: @lesson.trainer.id, user_id: current_user.id)
      @relationships = Relationship.find_by(trainer_id: @lesson.trainer.id, user_id: current_user.id)
      @reserve = Reserve.new(lesson_id: @lesson.id, user_id: current_user.id)
      @reserves = @lesson.reserves.where(take_lesson_status: "not_held")
    end
    gon.lesson = @lesson
  end

  def calendar
    @lessons = Lesson.all
  end

  private

  def lesson_search_params
    params.fetch(:search, {}).permit(:trainer_id, :lesson_genre, :take_lesson_genre, :title, :lesson_word, :start_time, :end_time, :total_time, :total_people, :lesson_details, :belongings, :lesson_status, :address)
  end

end
