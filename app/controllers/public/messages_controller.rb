class Public::MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to request.referer
    else
      @messages = @room.messages.includes(:user)
      redirect_to request.referer
    end


  end

  def destroy


  end

  private
    def message_params
      params.require(:message).permit(:room_id, :user_id, :trainer_id, :message, :sender).merge(user_id: current_user.id)
    end

end
