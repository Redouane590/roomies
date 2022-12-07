class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save

    other_users = @chatroom.colocation.users.reject { |user| user.id == current_user.id }

    other_users.each do |user|
      user.unread_messages += 1
      user.save

      NotificationChannel.broadcast_to(
        user,
        "user.unread_messages"
      )
      head :ok
    end

    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: {message: @message})
    )
    head :ok

    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
