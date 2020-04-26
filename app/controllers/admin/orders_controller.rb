class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.where.not(status: 3)
  end

  def show
    @order = Order.find(params[:id])
    @seller = @order.surprise.user
    @buyer = @order.user
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to admin_order_delete_complete_path
  end

  def destroy_complete
  end
end
