class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def history


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
