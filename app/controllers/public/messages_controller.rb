class Public::MessagesController < ApplicationController
before_action :authenticate_user! || :authenticate_trainer!

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
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referer
  end

  private
    def message_params
      params.require(:message).permit(:room_id, :user_id, :trainer_id, :message, :sender)
    end

end
