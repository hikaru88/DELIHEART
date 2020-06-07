class Admin::ChatRoomsController < ApplicationController
  def index
    @surprise = Surprise.find(params[:surprise_id])
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @seller = @chat_room.surprise.user
    @buyer = @chat_room.user
  end
end
