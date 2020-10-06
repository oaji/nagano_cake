class Admin::CustomersController < ApplicationController

  def index
  	@customers = Customer.page(params[:page])
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  		redirect_to admin_customer_path(@customer), notice: "Updated customer's infomation successfully."
  	else
  		@customer = Customer.find(params[:id])
  		render :edit
  	end
  end

  private
	def customer_params
		params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :telephone, :email, :is_active)
	end

end



