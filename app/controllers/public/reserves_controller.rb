class Public::ReservesController < ApplicationController
  def create
    @reserve = Reserves.new(reserve_params)
    @reserve.save
    redirect_to request.referer
  end

  def update
    @reserve = Reserves.find(params[:id])
    @reserve.update(reserve_params)
    if params[:reserve][:take_lessson_status] == "held"
      @reserve.lesson.update(lesson_status: "held")
    end
  end

  def destroy
    @reserve = Reserves.find(params[:id])
    @reserve.destroy
    redirect_to request.referer
  end

  private
    def reserve_params
      params.require(:reserve).permit(:lesson_id, :user_id, :take_lesson_genre)
    end

end
