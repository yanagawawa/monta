class Public::LessonsController < ApplicationController

  def index
    @lessons = Lesson.get_not_held
    @lessons_in_person = Lesson.get_not_held.where(take_lesson_genre: "in_person")
    @lessons_in_person_personal = Lesson.get_not_held.where(take_lesson_genre: "in_person_personal")
    @lessons_live = Lesson.get_not_held.where(take_lesson_genre: "live")
    @lessons_online_personal = Lesson.get_not_held.where(take_lesson_genre: "online_personal")
    @search_params = lesson_search_params
    @trainers = (params[:start_time].present? && params[:start_time_end].present?) ?
      Lesson.where("start_time >= ? AND start_time < ?",Date.parse(params[:start_time]), Date.parse(params[:start_time])+1) :
      Lesson.get_not_held.search(@search_params)
    if (params[:start_time].present? && params[:start_time_end].present?) || @search_params.present?
      @lessons = @trainers
      @lessons_in_person =  @lessons.where(take_lesson_genre: "in_person")
      @lessons_in_person_personal =  @lessons.where(take_lesson_genre: "in_person_personal")
      @lessons_live =  @lessons.where(take_lesson_genre: "live")
      @lessons_online_personal =  @lessons.where(take_lesson_genre: "online_personal")
    end
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
    params.fetch(:search, {}).permit(:prefectures, :trainer_id, :lesson_genre, :take_lesson_genre, :title, :lesson_word, :start_time, :start_time_end, :total_time, :total_people, :lesson_details, :belongings, :lesson_status, :address)
  end

end
