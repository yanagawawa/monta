class Public::ReservesController < ApplicationController

  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.save
    redirect_to request.referer
  end

  def update
    @reserve = Reserve.find(params[:id])
    @reserve.update(reserve_params)
    redirect_to request.referer
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    redirect_to request.referer
  end

  private
    def reserve_params
      params.require(:reserve).permit(:lesson_id, :user_id, :take_lesson_status)
    end

end
