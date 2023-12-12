class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    # # Dessaie
    # @all_chatrooms = (Chatroom.all + PrivateChatroom.all)
    # # Fessaie
    @message = Message.new
    @chatrooms = current_user.chatrooms
    if params[:query].present?
      @chatrooms = @chatrooms.where("name ILIKE ?", "%#{params[:query]}%")
    end
# private chatrooms
    @private_message = PrivateMessage.new
    @private_chatrooms = PrivateChatroom.where(user_1:current_user).or(PrivateChatroom.where(user_2:current_user))
    if params[:query].present?
      @private_chatrooms = @private_chatrooms.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @park = Park.find(params[:id])
    @chatroom = Chatroom.find_or_create_by(park: @park)

    @messages = @chatroom.messages
    @message = Message.new
  end

end
