class Trainer::TakeLessonGenresController < ApplicationController
  def update
    @take_lesson_genre = TakeLessonGenre.find(params[:id])
    @take_lesson_genre.update(take_lesson_genre_params)

  end

  private
    def take_lesson_genre_params
      params.require(:take_lesson_genre).permit(:genre)
    end
end
