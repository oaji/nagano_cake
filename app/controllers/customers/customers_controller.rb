class Customers::CustomersController < ApplicationController
	before_action :authenticate_customer!

	def show
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
		@customer = current_customer
		if @customer.update(customer_params)
			redirect_to customers_path,notice: "会員情報変更しました"
		else
			render :edit
		end
	end

	def hide
		@customer = current_customer
    end

    def complete
    	@customer = current_customer
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @customer.update(is_deleted: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
	end



	private
	def customer_params
		 params.require(:customer).permit(:first_name, :first_name_kana,:family_name,:family_name_kana,:post_code,:address,:telephone,:email)
	end
end