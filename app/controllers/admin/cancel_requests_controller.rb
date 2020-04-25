class Admin::CancelRequestsController < ApplicationController
  def index
    @cancel_requests = CancelRequest.all
  end

  def show
    @cancel_request = CancelRequest.find(params[:id])
  end

  def reject
    cancel_request = CancelRequest.find(params[:id])
    @order = cancel_request.order
    cancel_request.destroy
  end

end
