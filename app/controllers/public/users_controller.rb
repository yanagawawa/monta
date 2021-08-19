class Public::UsersController < ApplicationController

  def show

  end

  def history


  end

  def edit

  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
    end

end
