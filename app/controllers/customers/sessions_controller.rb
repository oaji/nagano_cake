# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController

    before_action :reject_customer, only: [:create]



   protected

   def reject_customer
     @customer == current_customer

    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to customers_sign_in_path
      end
      else
      flash[:error] = "必須項目を入力してください。"
    end

  end

end
