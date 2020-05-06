class User::AddressesController < ApplicationController
  def new
    @address_new = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def index
    @addresses = current_user.addresses
  end

  def create
    @address_new = Address.new(address_params)
    @address_new.user_id = current_user.id
    @address_new.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
    def address_params
      params.require(:address).permit(:receiver, :postal_code, :prefecture, :city, :after)
    end

end
