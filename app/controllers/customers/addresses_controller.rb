class Customers::AddressesController < ApplicationController
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
      redirect_to addresses_path, notice: "住所の登録が完了しました"
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
	  redirect_to addresses_path, notice: "編集が完了しました"
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to addresses_path, notice: "消去が完了しました"
  end

  private

  def address_params
  	params.require(:address).permit(:post_code, :customer_address, :name)
  end
end
