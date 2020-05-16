class User::OrdersController < ApplicationController
  def new
    session[:order] = Order.new()
    session[:order]["surprise_id"] = params[:surprise_id]
    @order_new = Order.new
    @address = current_user.addresses.find_by(is_default: true)
  end

  def create_session
    surprise = Surprise.find(session[:order]["surprise_id"])
    session[:order]["user_id"] = current_user.id
    session[:order]["surprise_name"] = surprise.name
    session[:order]["surprise_image"] = surprise.main_image
    session[:order]["payment_method"] = order_params[:payment_method]

    if params[:address_key].to_i == 1
      address = current_user.addresses.find_by(is_default: true)
      session[:order]["receiver"] = address.receiver
      session[:order]["postal_code"] = address.postal_code
      session[:order]["address"] = "#{address.prefecture} #{address.city} #{address.after}"

    elsif params[:address_key].to_i == 2
      address = Address.find(params[:order][:key])
      session[:order]["receiver"] = address.receiver
      session[:order]["postal_code"] = address.postal_code
      session[:order]["address"] = "#{address.prefecture} #{address.city} #{address.after}"

    elsif params[:address_key].to_i == 3
      address = Address.create(user_id: current_user.id,
                              receiver: params[:order][:address][:receiver],
                              postal_code: params[:order][:address][:postal_code],
                              prefecture: params[:order][:address][:prefecture],
                              city: params[:order][:address][:city],
                              after: params[:order][:address][:after]
                              )
      session[:order]["receiver"] = address.receiver
      session[:order]["postal_code"] = address.postal_code
      session[:order]["address"] = "#{address.prefecture} #{address.city} #{address.after}"
    end
    redirect_to order_confirm_path
  end

  def confirm
    @surprise = Surprise.find(session[:order]["surprise_id"])
    @order = session[:order]
  end

  def show
    @order = Order.find(params[:id])
    @seller = @order.surprise.user
    @buyer = @order.user
    @review_new = Review.new
    @order_message_new = OrderMessage.new
  end

  def index
    @orders = current_user.orders
  end

  def create
    order = Order.create(session[:order])
    session[:order].clear
    redirect_to order_path(order)
  end

  def update
    order = Order.find(params[:id])
    order.update(status: order.status_before_type_cast + 1)
    redirect_to order_path(order)
  end

  def complete
    # いらないんじゃね？
  end

  private
    def order_params
      params.require(:order).permit(:payment_method)
    end
end
