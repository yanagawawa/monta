class Public::LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
    @take_lesson_genres = TakeLessonGenre.all
    @lesson_genres = LessonGenre.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def calendar
  end

end
