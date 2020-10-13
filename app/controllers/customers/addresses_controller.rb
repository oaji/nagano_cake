class Customers::AddressesController < ApplicationController
  before_action :authenticate_customer!


  def index
    @customer = current_customer
    @addresses = current_customer.addresses
  	@address = Address.new
    @addresses = Address.page(params[:page]).reverse_order
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:success] = "住所の登録が完了しました"
      redirect_to addresses_path
    else
       @addresses = Address.all
       @address = Address.new
       render 'index'
    end
    #byebug
  end

  def edit
  	@address = Address.find(params[:id])
  	@address.customer == current_customer
  end

  def update
  	@address = Address.find(params[:id])
  	@address.update(address_params)
    flash[:success] = "編集が完了しました"
	  redirect_to addresses_path
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
    flash[:success] = "消去が完了しました"
  	redirect_to addresses_path
  end

  private

  def address_params
  	params.require(:address).permit(:post_code, :customer_address, :name)
  end
end
