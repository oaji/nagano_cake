class Customers::AddressesController < ApplicationController
  def index
  	@addresses = Address.all
  	@address = address.new
  	@customer = current_customer
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

  def order_params
  	params.require(:address).permit(:post_code, :customer_address)
  end
end
