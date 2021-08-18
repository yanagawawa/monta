class Public::ReservesController < ApplicationController
  def create

  end

  def update

  end

  def destroy

  end

  private
    def reserve_params
      params.require(:reserve).permit(:lesson_id, :user_id, :take_lesson_genre)
    end

end
