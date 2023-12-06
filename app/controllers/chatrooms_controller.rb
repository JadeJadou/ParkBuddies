class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @chatrooms = current_user.chatrooms
    if params[:query].present?
      @chatrooms = @chatrooms.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages
  end

end
