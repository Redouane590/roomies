class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @message.chatroom = @chatroom
    @message.user = current_user
    #if @message.save
    #redirect_to colocation_chatroom_path(@chatroom)
    #else
    #render "chatrooms/show", status: :unprocessable_entity
    #end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
