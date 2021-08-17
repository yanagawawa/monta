class Public::RelationshipsController < ApplicationController

  def create
    @user = Trainer.find(params[:relationship][:trainer_id])
    @relationship = Relationship.new(relationship_params)
    @relationship.save
    redirect_to request.referer
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to request.referer
  end

   private
    def relationship_params
      params.require(:relationship).permit(:trainer_id, :user_id)
    end

end
