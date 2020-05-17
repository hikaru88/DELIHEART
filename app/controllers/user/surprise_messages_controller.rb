class User::SurpriseMessagesController < ApplicationController
  def create
    message = current_user.surprise_messages.new(surprise_message_params)
    message.surprise_id = params[:surprise_id]
    message.save
    redirect_to surprise_path(params[:surprise_id])
  end

  def destroy
    message = SurpriseMessage.find(params[:id])
    surprise = message.surprise
    message.destroy
    redirect_to surprise_path(surprise)
  end

  private
    def surprise_message_params
      params.require(:surprise_message).permit(:text)
    end
end
