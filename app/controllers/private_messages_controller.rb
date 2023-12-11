class PrivateMessagesController < ApplicationController
  def create
    @private_chatroom = PrivateChatroom.find(params[:private_chatroom_id])
    @private_message = PrivateMessage.new(private_message_params)
    @private_message.private_chatroom = @private_chatroom
    @private_message.user = current_user
    if @private_message.save
      PrivateChatroomChannel.broadcast_to(
        @private_chatroom,
        private_message: render_to_string(partial: "private_message",
      locals: {private_message: @private_message}),
        sender_id: @private_message.user.id
      )
      head :ok
    else
      render "private_chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def private_message_params
    params.require(:private_message).permit(:content)
  end
end
