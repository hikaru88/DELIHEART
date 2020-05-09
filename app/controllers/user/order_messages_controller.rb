class User::OrderMessagesController < ApplicationController
  def create
    order_message = current_user.order_messages.build(order_message_params)
    order_message.order_id = params[:order_id].to_i
    order_message.save
    redirect_to order_path(params[:order_id])
  end

  private
    def order_message_params
      params.require(:order_message).permit(:text)
    end
end
