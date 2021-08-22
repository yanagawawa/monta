class Public::RoomsController < ApplicationController

  def index
    if current_user.present?
      @rooms = Room.where(user_id: current_user.id)
      @messages = Message.where(sender: false, is_read: false)
    elsif current_trainer.present?
      @rooms = Room.where(trainer_id: current_trainer.id)
      @messages = Message.where(sender: true, is_read: false)
    end
  end

  def show
    @message = Message.new
    @message.user = current_user
    @message.trainer = current_trainer
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user, :trainer)
    # 三項演算子
    @sender = current_user ? true : false
    # 既読機能
    if current_user.present?
       Message.where(sender: false, is_read: false).each do |message|
        message.update(is_read: true)
      end
    elsif current_trainer.present?
      Message.where(sender: true, is_read: false).each do |message|
        message.update(is_read: true)
      end
    end
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
