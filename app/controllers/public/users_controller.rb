class Public::UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = current_user
    @today_lesson = @user.lessons.where("lessons.start_time >= ? AND lessons.start_time < ?", Date.today,Date.today+1).reorder(:start_time)
    @reserves = @user.reserves.where("reserves.take_lesson_status = 0").joins(:lesson).where("lessons.start_time >= ?", Date.today).reorder("lessons.start_time")
  end

  def history
    @user = current_user
    @lessons = @user.lessons
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to  user_path(@user.id)
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
    end

end
