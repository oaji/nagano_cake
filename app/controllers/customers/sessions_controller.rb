# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController

    before_action :reject_customer, only: [:create]



   protected

   def reject_customer
     @customer == current_customer #Customer.find_by(email: params[:customer][:email].downcase) #ここのparams以後の（）内どうするか
     binding.pry
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    end
  end

end
