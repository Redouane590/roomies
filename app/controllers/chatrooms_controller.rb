class ChatroomsController < ApplicationController
  def show
    current_user.unread_messages = 0
    current_user.save
    @colocation = Colocation.find(params[:colocation_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
