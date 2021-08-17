class Public::RelationshipsController < ApplicationController

  def create
    @user = Trainer.find(params[:relationship][:trainer_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end

end
