class PrivateChatroomsController < ApplicationController

  def index
    @private_message = PrivateMessage.new
    @private_chatroom = current_user.private_chatrooms
    if params[:query].present?
      @chatrooms = @chatrooms.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @private_chatroom = PrivateChatroom.find(params[:id])
    @private_message = PrivateMessage.new
    @private_messages = @private_chatroom.private_messages
    @other_user = @private_chatroom.users.where.not(id: current_user.id)
  end

  # def create
  #   @private_chatroom = PrivateChatroom.new
  #   @private_chatroom.users << current_user
  #   @private_chatroom.users << User.find(params[:user_id])
  #   if @private_chatroom.save
  #     redirect_to private_chatroom_path(@private_chatroom)
  #   else
  #     redirect_to private_chatrooms_path
  #   end
  # end
end
