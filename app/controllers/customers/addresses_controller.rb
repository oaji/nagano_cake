class Customers::AddressesController < ApplicationController
  def index
  	@addresses = Address.all
  	@address = Address.new
  	@customer = current_customer
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address.id), notice: "住所の登録が完了しました"
    else
      @addresses = Address.all
      @address = Address.new
      render 'index'
    end
  end

  def edit
  	@address = Address.find(params[:id])
  	@address.customer == current_customer
  end

  def update
  	@address = Address.find(params[:id])
  	@address.update(params[:id])
	  redirect_to addresses_path(@address), notice: "編集が完了しました"
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
