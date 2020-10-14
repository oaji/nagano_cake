class Customers::CustomersController < ApplicationController

	before_action :authenticate_customer!

	def index
		@orders = Order.all
	end

	def show
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
		@customer = current_customer
		if @customer.update(customer_params)
			redirect_to customers_path
			flash[:change] = "会員情報を更新しました"
		else
			render :edit
		end
	end

	def hide
		@customer = current_customer
    end

    def complete
    	@customer = current_customer
        @customer.update(is_deleted: true)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
	end



	private
	def customer_params
		 params.require(:customer).permit(:first_name, :first_name_kana,:family_name,:family_name_kana,:post_code,:address,:telephone,:email)
	end
end