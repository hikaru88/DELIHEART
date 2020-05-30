class User::CancelRequestsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @cancel_request_new = CancelRequest.new
  end

  def create
    @cancel_request_new = current_user.cancel_requests.new(cancel_request_params)
    @cancel_request_new.order_id = params[:order_id].to_i
    @cancel_request_new.save
    redirect_to cancel_requests_success_path
  end

  def success
  end

  private
    def cancel_request_params
      params.require(:cancel_request).permit(:reason)
    end
end
