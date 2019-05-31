class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(params.require(:chat_room).permit(:title))
    if @chat_room.save
      redirect_to chat_rooms_path, notice: "Create chat room success"
    else
      render :new
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end
end
