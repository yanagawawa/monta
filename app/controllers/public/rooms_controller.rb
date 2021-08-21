class Public::RoomsController < ApplicationController

  def index
    @rooms = Room.find_by()
  end

  def show
    @message = Message.new
    @message.user = current_user
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user, :trainer)
    @sender = "user"
    # 既読未読を識別するために、送り主をbooleanで識別する
    # if @massage.user = current_user
    #   @sender = false
    # else
    #   @sender = true
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

  end

end
