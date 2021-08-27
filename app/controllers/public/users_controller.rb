class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @today_lesson = @user.lessons.where("lessons.start_time > ?", DateTime.now).reorder(:start_time)
    @reserves = @user.reserves.where(take_lesson_status: "not_held")
    # @reserves = @user.lessons.where("lessons.start_time > ?", DateTime.now).reorder(:start_time).joins(:reserves).where(take_lesson_status: "not_held")
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
