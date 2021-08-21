class Public::RoomsController < ApplicationController

  def index
    if current_user.present?
      @rooms = Room.where(user_id: current_user.id)
    elsif current_trainer.present?
      @rooms = Room.where(trainer_id: current_trainer.id)
    end
  end

  def show
    @message = Message.new

    @message.user = current_user
    @message.trainer = current_trainer

    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user, :trainer)
    @sender = "trainer"
    # 既読未読を識別するために、送り主をbooleanで識別する
    # if @massage.user = current_user
    #   @sender = "user"
    # elsif @massage.trainer = current_trainer
    #   @sender = "trainer"
    # end
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @room = Room.find_or_create_by(user_id: current_user.id, trainer_id: @trainer.id)
    redirect_to room_path(@room)
  end

  def create

  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

end
