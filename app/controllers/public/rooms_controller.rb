class Public::RoomsController < ApplicationController

  def index

  end

  def show
    @message = Message.new
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user, :trainer)
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @room = Room.find_or_create_by(user_id: current_user.id, trainer_id: @trainer.id)
    redirect_to room_path(@room)
  end

  def create

  end

  def destroy

  end

end
