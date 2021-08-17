class Public::LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    gon.lesson = @lesson
  end

  def calendar
    @lessons = Lesson.all
  end

end
