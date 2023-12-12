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
    @park = Park.find(params[:id])
    @chatroom = Chatroom.find_or_create_by(park: @park)

    @messages = @chatroom.messages
    @message = Message.new
  end

end
