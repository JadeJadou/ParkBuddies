class PrivateChatroomsController < ApplicationController
  # def index
  #   @private_message = PrivateMessage.new
  #   @private_chatroom = current_user.private_chatrooms
  #   if params[:query].present?
  #     @chatrooms = @chatrooms.where("name ILIKE ?", "%#{params[:query]}%")
  #   end
  # end

  def show
    @buddy = User.find(params[:buddy_id])
    @private_chatroom = PrivateChatroom.find_by(user_1: @buddy, user_2: current_user)
    if @private_chatroom.nil?
      @private_chatroom = PrivateChatroom.find_or_create_by(user_1: current_user, user_2: @buddy) do |chatroom|
        chatroom.user_1 = current_user
        chatroom.user_2 = @buddy
        chatroom.name = "#{current_user.nickname} & #{@buddy.nickname}"
      end
    end
    @private_message = PrivateMessage.new
    @private_messages = @private_chatroom.private_messages
    @other_user = @buddy
  end
end
