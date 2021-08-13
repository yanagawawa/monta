class Trainer::LessonGenresController < ApplicationController
  def update
    @lesson_genre = LessonGenre.find(params[:id])
    @lesson_genre.update(lesson_genre_params)
  end

  private
    def lesson_genre_params
      params.require(:lesson_genre).permit(:genre)
    end
end
